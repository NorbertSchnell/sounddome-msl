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
  console.log(`websocket server connected`);

  socket.on('message', (message) => {
    const incoming = JSON.parse(message);
    Max.outlet(incoming);
  });
});
