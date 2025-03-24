const canvas = document.getElementById('canvas');
const context = canvas.getContext('2d');
const arrow = document.getElementById('arrow');
let clientId = null;
let clientHasStarted = false;
let clientIsActive = true;
let dripColor = null;

let dripDuration = 4;
let dripOffDuration = 2;
let dripGrowth = 120;
let maxDrips = 6;
let timeoutDuration = 10;

const colorMap = [
  '#44C7F1', '#37C000', '#F5D900', '#F39300',
  '#EC5D57', '#B36AE2', '#00FDFF', '#FF80BE',
  '#CAFA79', '#FFFF64', '#FF9EFF', '#007AFF'
];

/*********************************************
 * websocket communication
 */
const webSocketAddr = window.location.hostname;
const webSocketPort = 3000;

const socket = new WebSocket(`ws://${webSocketAddr}:${webSocketPort}`);

socket.addEventListener('open', (event) => {
  setInterval(() => {
    if (socket.readyState == socket.OPEN) {
      socket.send('');
    }
  }, 5000);

  startClient();

  // listen to messages from server
  socket.addEventListener('message', (event) => {
    const data = event.data;

    if (data.length > 0) {
      const message = JSON.parse(data);

      if (message[0] !== 1) {
        const selector = message[0];

        // dispatch incomming messages
        switch (selector) {
          case 'client-id': {
            clientId = message[1];
            dripColor = colorMap[clientId % colorMap.length];
            break;
          }

          case 'max-drips': {
            const maxDrips = Math.max(0, message[1])
            setMaxDrips(maxDrips);
            break;
          }

          case 'drip-duration': {
            dripDuration = Math.max(0, message[1])
            break;
          }

          case 'drip-off-duration': {
            dripOffDuration = Math.max(0, message[1]);
            break;
          }

          case 'drip-growth': {
            dripGrowth = Math.max(0, message[1]);
            break;
          }

          default:
            console.error(`received invalid message: ${message}`);
            break;
        }
      }
    }
  });
});

socket.addEventListener("close", (event) => {
  clientId = null;
  document.body.style.opacity = 0.333;
});

function sendMessage(message) {
  const str = JSON.stringify(message);
  socket.send(str);
}

/*********************************************
 * graphics
 */
let circleRenderer = null;
const clientTitle = document.getElementById('client-title');
const clientMessage = document.getElementById('client-message');
let width = 0;
let height = 0;
let size = 0;
let left = 0;
let top = 0;

clientTitle.innerText = 'Drips';

function onResize() {
  const rect = document.body.getBoundingClientRect();

  width = rect.width;
  height = rect.height;
  size = Math.min(width, height);
  left = 0.5 * (width - size);
  top = 0.5 * (height - size);

  canvas.width = width;
  canvas.height = height;

  const scaling = size / 400;
  arrow.style.transform = `scale(${scaling})`;
}

class Circle {
  constructor(x, y, duration, growth, color, opacity = 1) {
    this.x = x;
    this.y = y;
    this.color = color;

    this.growthVelocity = growth || 50; // pixels / sec
    this.minVelocity = 50; // if gain is < 0.25 => constant growth
    this.friction = -50; // pixels / sec

    this.lifeTime = duration;
    this.opacityScale = opacity / this.lifeTime;
    this.radius = 0;
  }

  render(dt, width, height) {
    this.lifeTime -= dt;

    if (this.growthVelocity > this.minVelocity) {
      this.growthVelocity += (this.friction * dt);
    }

    this.radius += this.growthVelocity * dt;

    if (this.lifeTime >= 0) {
      const x = 0.5 * width + 0.25 * this.x * size;
      const y = 0.5 * height - 0.25 * this.y * size;

      context.save();
      context.beginPath();
      context.fillStyle = this.color;
      context.globalAlpha = this.opacityScale * this.lifeTime;
      context.arc(x, y, Math.round(this.radius), 0, Math.PI * 2, false);
      context.fill();
      context.closePath();
      context.restore();
    }
  }
}

export class CircleRenderer {
  constructor() {
    this.circles = new Set();
    this.lastTime = null;
    this.render = this.render.bind(this);

    requestAnimationFrame(this.render);
  }

  render(time) {
    time *= 0.001;

    if (this.lastTime !== null) {
      const dt = time - this.lastTime;
      const width = canvas.width;
      const height = canvas.height;

      // clear canvas
      context.save();
      context.clearRect(0, 0, width, height);

      // draw circle
      context.globalAlpha = 1;
      context.strokeStyle = '#ccc';
      context.lineWidth = 2;
      context.beginPath();
      context.arc(0.5 * width, 0.5 * height, 0.25 * size, 0, 2 * Math.PI);
      context.stroke();

      // render circles
      for (let circle of this.circles) {
        if (circle.lifeTime > -dripOffDuration) {
          circle.render(dt, width, height);
        } else {
          this.circles.delete(circle);
          updateCount();
        }
      }

      context.restore();
    }

    this.lastTime = time;
    requestAnimationFrame(this.render);
  }

  get numCircles() {
    return this.circles.size;
  }

  start(x, y, color, duration) {
    const circle = new Circle(x, y, duration, dripGrowth, color);
    circle.time = null;
    this.circles.add(circle);
  }
}

/*********************************************
 * client
 */
function startClient() {
  if (circleRenderer === null) {
    circleRenderer = new CircleRenderer();
  }

  window.addEventListener('resize', onResize);
  onResize();

  clientHasStarted = true;
  window.addEventListener('touchstart', onTouchStart);
  updateCount();
}

function setMaxDrips(value) {
  if (value !== maxDrips) {
    maxDrips = value;
    updateCount();
  }
}

function updateCount() {
  if (clientHasStarted && clientIsActive) {
    const numAvailable = Math.max(0, maxDrips - circleRenderer.numCircles);
    let htmlContent = null;

    if (numAvailable > 0) {
      const numStr = (numAvailable === maxDrips) ?
        `<span class="huge">${numAvailable}</span>` :
        `<span class="huge">${numAvailable} of ${maxDrips}</span>`;
      const dripStr = (numAvailable === 1) ? 'drip' : 'drips';

      htmlContent = `<p>${numStr}<br />${dripStr} to play</p>`;
    } else {
      htmlContent = `<span class="big">Listen!</span>`;
    }


    clientMessage.innerHTML = htmlContent;
  }
}

/*********************************************
 * touch
 */
function onTouchStart(e) {
  if (clientId !== null) {
    const time = 0.001 * performance.now();

    for (let touch of e.changedTouches) {
      const id = touch.identifier;
      const x = 4 * (touch.pageX - 0.5 * width) / size;
      const y = -4 * (touch.pageY - 0.5 * height) / size;
      let azimuth = 0.5 * Math.PI - Math.atan2(y, x);
      let elevation = 0;
      let distance = Math.sqrt(x * x + y * y);

      if (azimuth > Math.PI) {
        azimuth = azimuth - 2 * Math.PI;
      }

      if (distance < 1) {
        elevation = 0.5 * Math.PI * (1 - distance);
        distance = 1;
      }

      if (circleRenderer.numCircles < maxDrips) {
        circleRenderer.start(x, y, dripColor, dripDuration, timeoutDuration);
        sendMessage(['sound', clientId, azimuth, elevation, distance]);
        updateCount();
      }
    }
  }
  e.preventDefault();
}
