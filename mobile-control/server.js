import express from 'express';
import WebSocket from 'ws';
import https from 'https';
import * as fs from 'fs';
import * as Max from 'max-api';

// openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout sslcert/selfsigned.key -out sslcert/selfsigned.crt
const key = fs.readFileSync('sslcert/selfsigned.key', 'utf8');
const cert = fs.readFileSync('sslcert/selfsigned.crt', 'utf8');
const credentials = { key, cert };

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
 * websoket server
 */
const webSocketServer = new WebSocket.Server({ server: httpsServer });
console.log(`websocket server listening on port ${httpPort}`);

// listen to new web socket connections
webSocketServer.on('connection', (socket, req) => {
  const clientIndex = addClientToList(socket);

  sendMessage(socket, ['client-index', clientIndex]);

  const clientCount = getClientCount();
  Max.outlet('client-count', clientCount);

  socket.on('message', (message) => {
    const incoming = JSON.parse(message);
    Max.outlet(incoming);
  });

  socket.on('close', () => {
    if (removeClientFromList(socket) !== null) {
      const clientCount = getClientCount();
      Max.outlet('client-count', clientCount);
    }
  });
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
