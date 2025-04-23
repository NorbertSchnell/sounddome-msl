import express from 'express';
import WebSocket from 'ws';
import https from 'https';
import * as fs from 'fs';
import { Client } from 'node-osc';

// mkdir sslcert
// openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout sslcert/selfsigned.key -out sslcert/selfsigned.crt
const key = fs.readFileSync('sslcert/selfsigned.key', 'utf8');
const cert = fs.readFileSync('sslcert/selfsigned.crt', 'utf8');
const credentials = { key, cert };

const maxClientCount = 6;

console.log(`sound dome node server running`);
const oscClient = new Client('localhost', 4000);

/****************************************************************
 * http server
 */
const httpPort = Number(process.env.PORT) || 3000;
const app = express();

const httpsServer = https
  .createServer(credentials, app)
  .listen(httpPort, () => console.log(`HTTPS server listening on port ${httpPort}`));

app.use(express.static('.'));

/****************************************************************
 * websocket server
 */
const webSocketServer = new WebSocket.Server({ server: httpsServer });
console.log(`websocket server listening on port ${httpPort}`);

// listen to new web socket connections
webSocketServer.on('connection', (socket, req) => {
  if (getClientCount() < maxClientCount) {
    const clientIndex = addClientToList(socket);
    const clientId = clientIndex;

    sendMessage(socket, ['client-id', clientId]);
    oscClient.send('client-connect', clientId);

    const clientCount = getClientCount();
    oscClient.send('client-count', clientCount);

    socket.on('message', (message) => {
      const incoming = JSON.parse(message);

      switch (incoming[0]) {
        case 'orientation': {
          const clientId = incoming[1];
          const azimuth = incoming[2];
          const distance = incoming[3];
          const elevation = incoming[4];

          // console.log('orientation', clientId, azimuth, distance, elevation);
          oscClient.send('orientation', clientId, azimuth, distance, elevation);
          break;
        }

        case 'sound': {
          const clientId = incoming[1];
          const x = incoming[2];
          const y = incoming[3];

          // playerId is paired with random number between 0 and 2, allowing for unique numbers for different sounds
          oscClient.send('sound', clientId, x, y);
          break;
        }
      }
    })

    socket.on('close', () => {
      if (removeClientFromList(socket) !== null) {
        oscClient.send('client-disconnect', clientId);

        const clientCount = getClientCount();
        oscClient.send('client-count', clientCount);
      }
    });
  };
});

function sendMessage(socket, message) {
  const str = JSON.stringify(message);
  socket.send(str);
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

function onOscError(err) {
  if (err) {
    console.error(err);
  }
}
