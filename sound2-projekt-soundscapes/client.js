//global variables
const messageElem = document.getElementById('message-display');
const indexElem = document.getElementById('client-index');
const canvas = document.getElementById('canvas');
const context = canvas.getContext('2d');

const minDistance = 1;
const maxDistance = 5;

let clientId = null;
let azimuth = 0;
let elevation = 0;
let distance = 3;
let refAlpha = null;
let touchStartTime = null;

let circles = [];
let circleColor = "red";
let circleDuration = 2000;

let time = 0;
let timeLastTouch = null;
let touchCooldown = 100;
let lastFrameTime = 0;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
event listeners*/
messageElem.innerText = 'touch screen to start';
document.body.addEventListener('click', onClick);

document.body.addEventListener('touchstart', onTouchStart);
document.body.addEventListener('touchmove', onTouchMove);
document.body.addEventListener('touchend', onTouchEnd);
document.body.addEventListener('touchcancel', onTouchEnd);

window.addEventListener('resize', updateCanvasSize);

function updateCanvasSize() {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
}

// touching the phone
let touchId = null;
let touchStartY = null;
let startDistance = null;
let lastClickTime = null;

function onClick() {
  const time = performance.now();

  if (lastClickTime === null) {
    init();
  } else if (time - lastClickTime < 200) {
    refAlpha = null;
  }

  lastClickTime = time;
}

// function onTouchStart(e) { //when user starts to touch the screen
//   if (touchId === null) {
//     const touch = e.touches[0];
//     const id = touch.identifier;
//     const y = touch.pageY;

//     touchId = id;
//     touchStartY = y;
//     startDistance = distance;
//   }
// }

// function onTouchMove(e) { //user moves while touching
//   for (let touch of e.touches) {
//     if (touch.identifier === touchId) {
//       const y = touch.pageY;
//       const dY = touchStartY - y;
//       const dist = 2 * (maxDistance - minDistance) * dY / canvas.height;

//       distance = Math.max(minDistance, Math.min(maxDistance, startDistance + dist));
//       break;
//     }
//   }
// }

// function onTouchEnd(e) { 
//   touchId = null;
// }

//touching phone (from drips) to get azimuth, distance, elevation from touched coordinates
function onTouchStart(e) {

  time = performance.now();
  if (touchId === null) {
    if (time - timeLastTouch >= touchCooldown) {
      const touch = e.touches[0];
      const id = touch.identifier;
      const y = touch.pageY;
      const x = touch.pageX;

      touchId = id;
      touchStartY = y;
      startDistance = distance;

      touchStartTime = 0.001 * performance.now();

      const newCircle = new Circle(x, y, circleDuration, circleColor);
      circles.push(newCircle);
    }
  }
}

function onTouchMove(e) { //user moves while touching
  for (let touch of e.touches) {
    if (touch.identifier === touchId) {
      const y = touch.pageY;
      const dY = touchStartY - y;
      const dist = 2 * (maxDistance - minDistance) * dY / canvas.height;

      if (dist > 20) {
        touchStartTime = null;
        distance = Math.max(minDistance, Math.min(maxDistance, startDistance + dist - 20));
      }

      break;
    }
  }
}

function onTouchEnd(e) {
  for (let touch of e.changedTouches) {
    if (touch.identifier === touchId) {
      const touchEndTime = 0.001 * performance.now();

      if (touchStartTime !== null && touchEndTime - touchStartTime < 0.15) {
        sendMessage(['sound', clientId]);
      }

      touchId = null;

      timeLastTouch = performance.now();
    }
  }
}

async function init() {
  messageElem.innerText = '';

  document.getElementById('compass').classList.add('compass-visible');
  document.getElementById('distance-slider').classList.add('visible');

  updateCanvasSize();

  if (DeviceOrientationEvent) {
    if (DeviceOrientationEvent.requestPermission) {
      const permission = await DeviceOrientationEvent.requestPermission();

      if (permission == "granted") {
        start();
      } else {
        setErrorMessage("no permission for device orientation");
      }
    } else {
      start();// no permission needed on non-iOS devices
    }
  } else {
    setErrorMessage("device orientation not available");
  }
}



function start() {
  window.addEventListener("deviceorientation", onDeviceOrientation);
  requestAnimationFrame(onAnimationFrame);
}

function setErrorMessage(text) {
  messageElem.innerText = text;
  messageElem.classList.add('error');
}

function onDeviceOrientation(e) {
  if (refAlpha === null) {
    refAlpha = e.alpha;
  }

  let alpha = e.alpha - refAlpha;
  let beta = e.beta;

  if (beta > 90) {
    azimuth = alpha - 180;
    elevation = 180 - beta;
  } else if (beta < -90) {
    azimuth = alpha - 180;
    elevation = -beta - 180;
  } else {
    azimuth = alpha;
    elevation = beta;
  }

  if (azimuth < -180) {
    azimuth += 360;
  } else if (azimuth >= 180) {
    azimuth -= 360;
  }

  const distance = document.getElementById('distance-slider').value;//get slider value for distance

  // paint stroke with normalized start and end coordinates and color
  const outgoing = ['orientation', clientId, -azimuth, 40, elevation];

  if (clientId !== null) {
    const str = JSON.stringify(outgoing);
    socket.send(str);
  }
}

const minCircleSize = 20;
const maxCircleSize = 120;

function onAnimationFrame() {

  const width = canvas.width;
  const height = canvas.height;
  const maxRadius = Math.min(width, height) / 2.7;
  const normDist = (distance - minDistance) / (maxDistance - minDistance);
  const circleSize = maxCircleSize - (maxCircleSize - minCircleSize) * normDist;

  context.clearRect(0, 0, width, height);

  const displayAzimuth = Math.PI * -azimuth / 180 + 0.5 * Math.PI;
  const displayElevation = Math.PI * elevation / 180;
  const radius = Math.abs(maxRadius * Math.cos(displayElevation));
  const x = radius * Math.cos(displayAzimuth);
  const y = radius * Math.sin(displayAzimuth);

  const centerX = 0.5 * width - x;
  const centerY = 0.5 * height - y;
  const innerCircleRadius = Math.max(0, Math.abs(radius - 0.5 * circleSize));
  const outerCircleRadius = Math.max(0, Math.abs(radius + 0.5 * circleSize));
  const midCircleRadius = Math.max(0, radius);

  if (elevation >= 0) {
    context.fillStyle = '#0ff';
    context.strokeStyle = '#0ff';
  } else {
    context.fillStyle = '#f0f';
    context.strokeStyle = '#f0f';
  }

  context.globalAlpha = 1;
  context.lineWidth = 0.5;
  context.beginPath();
  context.arc(0.5 * width, 0.5 * height, innerCircleRadius, 0, 2 * Math.PI);
  context.moveTo(0.5 * width + outerCircleRadius, 0.5 * height);
  context.arc(0.5 * width, 0.5 * height, outerCircleRadius, 0, 2 * Math.PI);
  context.stroke();

  context.globalAlpha = 0.2;
  context.lineWidth = circleSize;
  context.beginPath();
  context.arc(0.5 * width, 0.5 * height, midCircleRadius, 0, 2 * Math.PI);
  context.stroke();

  context.globalAlpha = 1;
  context.beginPath();
  context.arc(centerX, centerY, 0.5 * circleSize, 0, 2 * Math.PI);
  context.fill();

  messageElem.innerHTML = `${Math.round(azimuth)} | ${Math.round(elevation)} | ${distance.toFixed(2)}`;

  dt = performance.now() - lastFrameTime;
  for (circle of circles) {
    circle.render(dt, window.width, window.height); //dt?
  }

  lastFrameTime = performance.now();
  requestAnimationFrame(onAnimationFrame);
}

/****************************************************************
 * websocket communication
 */
const webSocketPort = 3000;
const webSocketAddr = window.location.hostname;

const socket = new WebSocket(`wss://${webSocketAddr}:${webSocketPort}`);
// const socket = new WebSocket(`ws://${webSocketAddr}:${webSocketPort}`);

// listen to opening websocket connections
socket.addEventListener('open', (event) => {
});

socket.addEventListener("close", (event) => {
  clientId = null;
  //document.body.style.opacity = 0.333;
});

// listen to messages from server
socket.addEventListener('message', (event) => {
  const message = event.data;

  if (message.length > 0) {
    const incoming = JSON.parse(message);
    const selector = incoming[0]; //message carries client id

    // dispatch incomming messages
    switch (selector) {
      case 'client-id':
        clientId = incoming[1];
        indexElem.innerHTML = clientId;
        break;

      default:
        break;
    }
  }
});

function sendMessage(message) {
  const str = JSON.stringify(message);
  socket.send(str);
}

//offline warning
const offlineWarning = document.getElementById('offline-warning');

window.addEventListener('offline', () => {
  offlineWarning.style.display = 'flex';
});

window.addEventListener('online', () => {
  offlineWarning.style.display = 'none';
});

