import express from 'express';
import WebSocket from 'ws';
import http from 'http';
import * as Max from 'max-api';

/****************************************************************
 * http server
 */
const httpPort = 3000;
const app = express();

const httpServer = http
  .createServer(app)
  .listen(httpPort, () => console.log(`HTTP server listening on port ${httpPort}`));

app.use(express.static('.'));

/****************************************************************
 * websocket server
 */
const webSocketServer = new WebSocket.Server({ server: httpServer });
console.log(`websocket server listening`);

webSocketServer.on('connection', (socket, req) => {
  const playerIndex = addPlayerToList(socket);

  sendMessage(socket, ['player-index', playerIndex]);
  sendCurrentParameterValues(socket);

  const playerCount = getPlayerCount();
  Max.outlet('player-count', playerCount);

  socket.on('message', (data) => {
    if (data.length > 0) {
      const message = JSON.parse(data);
      const selector = message[0];

      switch (selector) {
        case 'sound': {
          const playerIndex = message[1];
          const azimuth = message[2];
          const elevation = message[3];
          const distance = message[4];
          Max.outlet('sound', playerIndex, azimuth, elevation, distance);
          break;
        }

        default:
          break;
      }
    } else {

    }
  });

  socket.on('close', () => {
    if (removePlayerFromList(socket) !== null) {
      const playerCount = getPlayerCount();
      Max.outlet('player-count', playerCount);
    }
  });
});

function sendMessage(socket, message) {
  const str = JSON.stringify(message);
  socket.send(str);
}

function sendToAllPlayers(message) {
  const str = JSON.stringify(message);
  sendStrToSet(playerList, str);
}

function sendStrToSet(set, str, except = null) {
  for (let socket of set) {
    if (socket !== null && socket !== except) {
      socket.send(str);
    }
  }
}

/****************************************************************
 * params
 */
const params = {
  'max-drips': 6,
  'drip-duration': 4,
  'drip-off-duration': 2,
  'drip-growth': 120,
}

for (let p in params) {
  Max.addHandler(p, (value) => {
    params[p] = value;
    sendToAllPlayers([p, value]);
  });
}

function sendCurrentParameterValues(socket) {
  for (let p in params) {
    sendMessage(socket, [p, params[p]]);
  }
}

/****************************************************************
 * players
 */
const playerList = [];
const freePlayerIndices = new Set();
const playerIndices = new Map();

function getFreePlayerIndex() {
  const iter = freePlayerIndices.values();
  const first = iter.next();
  const index = first.value;

  if (index !== undefined) {
    freePlayerIndices.delete(index);
    return index;
  }

  return playerList.length;
}

function addPlayerToList(socket) {
  const playerIndex = getFreePlayerIndex();

  playerList[playerIndex] = socket;
  playerIndices.set(socket, playerIndex);

  return playerIndex;
}

function removePlayerFromList(socket) {
  const playerIndex = playerIndices.get(socket);

  if (playerIndex !== undefined && playerList[playerIndex]) {
    playerList[playerIndex] = null;
    freePlayerIndices.add(playerIndex);

    // clear list
    let lastIndex = playerList.length - 1;
    while (lastIndex >= 0 && playerList[lastIndex] === null) {
      freePlayerIndices.delete(lastIndex);
      playerList.length = lastIndex;
      lastIndex--;
    }

    playerIndices.delete(socket);

    return playerIndex;
  }

  return null;
}

function getPlayerCount() {
  return playerIndices.size;
}
