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
  const clientIndex = addClientToList(socket);
  const clientId = clientIndex + 1;

  sendMessage(socket, ['client-id', clientId]);
  sendCurrentParameterValues(socket);
  Max.outlet('client-connect', clientId);

  const clientCount = getClientCount();
  Max.outlet('client-count', clientCount);

  socket.on('message', (data) => {
    if (data.length > 0) {
      const message = JSON.parse(data);
      const selector = message[0];

      switch (selector) {
        case 'sound': {
          const clientId = message[1];
          const azimuth = message[2];
          const elevation = message[3];
          const distance = message[4];
          Max.outlet('sound', clientId, azimuth, elevation, distance);
          break;
        }

        default:
          break;
      }
    } else {

    }
  });

  socket.on('close', () => {
    if (removeClientFromList(socket) !== null) {
      Max.outlet('client-disconnect', clientId);

      const clientCount = getClientCount();
      Max.outlet('client-count', clientCount);
    }
  });
});

function sendMessage(socket, message) {
  const str = JSON.stringify(message);
  socket.send(str);
}

function sendToAllClients(message) {
  const str = JSON.stringify(message);
  sendStrToSet(clientList, str);
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
    sendToAllClients([p, value]);
  });
}

function sendCurrentParameterValues(socket) {
  for (let p in params) {
    sendMessage(socket, [p, params[p]]);
  }
}

/****************************************************************
 * clients
 */
const clientList = [];
const freeClientIndices = new Set();
const clientIndices = new Map();

function getFreeClientIndex() {
  const iter = freeClientIndices.values();
  const first = iter.next();
  const index = first.value;

  if (index !== undefined) {
    freeClientIndices.delete(index);
    return index;
  }

  return clientList.length;
}

function addClientToList(socket) {
  const clientIndex = getFreeClientIndex();

  clientList[clientIndex] = socket;
  clientIndices.set(socket, clientIndex);

  return clientIndex;
}

function removeClientFromList(socket) {
  const clientIndex = clientIndices.get(socket);

  if (clientIndex !== undefined && clientList[clientIndex]) {
    clientList[clientIndex] = null;
    freeClientIndices.add(clientIndex);

    // clear list
    let lastIndex = clientList.length - 1;
    while (lastIndex >= 0 && clientList[lastIndex] === null) {
      freeClientIndices.delete(lastIndex);
      clientList.length = lastIndex;
      lastIndex--;
    }

    clientIndices.delete(socket);

    return clientIndex;
  }

  return null;
}

function getClientCount() {
  return clientIndices.size;
}
