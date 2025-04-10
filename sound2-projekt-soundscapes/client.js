import { Circle, size } from './Circle.js';

// Global variables
const messageElem = document.getElementById('message-display');
const indexElem = document.getElementById('client-index');
const canvas = document.getElementById('canvas');
const context = canvas.getContext('2d');


const minDistance = 1;
const maxDistance = 5;

let clientId = null;
let azimuth = 0;
let elevation = 0;
let distance = 50;
let refAlpha = null;
let touchStartTime = null;

let circles = [];
let circleColor = "#0ff";
let circleDuration = 2;

let timeLastTouch = null;
let touchCooldown = 100;
let lastFrameTime = 0;

/* Event listeners */
messageElem.innerText = 'touch screen to start';
document.body.addEventListener('click', onClick);

document.body.addEventListener('touchstart', onTouchStart);
document.body.addEventListener('touchend', onTouchEnd);
document.body.addEventListener('touchcancel', onTouchEnd);

window.addEventListener('resize', handleResize);
window.addEventListener('orientationchange', handleOrientationChange);

function handleResize() {
    updateCanvasSize();
    requestAnimationFrame(onAnimationFrame);
}

function handleOrientationChange() {
    setTimeout(() => {
        updateCanvasSize();
        requestAnimationFrame(onAnimationFrame);
    }, 100);
}

function updateCanvasSize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    context.clearRect(0, 0, canvas.width, canvas.height);
}

// Touch handling
let touchId = null;
let touchStartY = null;
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

function onTouchStart(e) {
    // console.log("Touch started at:", e.touches[0].pageX, e.touches[0].pageY);

    const time = performance.now();
    if (touchId === null) {
        if (time - timeLastTouch >= touchCooldown) {
            const touch = e.touches[0];
            const id = touch.identifier;
            const y = touch.pageY;

            touchId = id;
            touchStartY = y;

            touchStartTime = 0.001 * performance.now();
        }
    }
}

function onTouchEnd(e) {
    for (let touch of e.changedTouches) {
        if (touch.identifier === touchId) {
            const touchEndTime = 0.001 * performance.now();

            if (touchStartTime !== null && touchEndTime - touchStartTime < 0.15 && lastClickTime !== null) {
                const x = touch.pageX;
                const y = touch.pageY;
                const normX = x / canvas.width;
                const normY = y / canvas.height;

                sendMessage(['sound', clientId, normX, normY]);

                const newCircle = new Circle(x, y, circleDuration, circleColor);
                circles.push(newCircle);
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
            start();
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

const sliderElem = document.getElementById('distance-slider');


sliderElem.addEventListener("input", (event) => {
  const value = parseInt(event.target.value);
  distance = value;
});

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

    //console.log('orientation', clientId, -azimuth, 40, elevation)
    const outgoing = ['orientation', clientId, -azimuth, distance, elevation];

    if (clientId !== null) {
        const str = JSON.stringify(outgoing);
        socket.send(str);
    }
}

const minCircleSize = 20;
const maxCircleSize = 60;

function onAnimationFrame() {
    const width = canvas.width;
    const height = canvas.height;
    const maxRadius = Math.min(width, height) / 2.7;
    const normDist = (distance - 35) / 65;
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

    // Render circles
    const dt = 0.001 * (performance.now() - lastFrameTime);
    for (let circle of circles) {
        circle.render(dt, width, height, context);
    }

    // Remove expired circles
    circles = circles.filter(circle => circle.lifeTime > 0);

    lastFrameTime = performance.now();
    requestAnimationFrame(onAnimationFrame);
}

// WebSocket communication
const webSocketPort = 3000;
const webSocketAddr = window.location.hostname;
const socket = new WebSocket(`wss://${webSocketAddr}:${webSocketPort}`);

socket.addEventListener('open', (event) => { });

socket.addEventListener("close", (event) => {
    clientId = null;
});

socket.addEventListener('message', (event) => {
    const message = event.data;

    if (message.length > 0) {
        const incoming = JSON.parse(message);
        const selector = incoming[0];

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

// Initialize
updateCanvasSize();