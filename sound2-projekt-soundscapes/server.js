//needed modules
import express from 'express';
import WebSocket from 'ws';
import https from 'https';
import * as fs from 'fs';
import * as Max from 'max-api';

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//stuff - norbert fragen!

const key = fs.readFileSync('sslcert/selfsigned.key', 'utf8');
const cert = fs.readFileSync('sslcert/selfsigned.crt', 'utf8');
const credentials = { key, cert };

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//http server

const httpPort = Number(process.env.PORT) || 3000;
const app = express();

const httpsServer = https
    .createServer(credentials, app)
    .listen(httpPort, () => console.log('HTTPS server listening on port ${httpPort}'));

app.use(express.static('.'));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//websocket server

const webSocketServer = new WebSocket.Server({server: httpsServer});
console.log('websocket server listening on port ${httpPort}');

//listening to new web socket connections
webSocketServer.on('connection', (socket, req) => { //as soon as new phone connects
    const clientIndex = addClientToList(socket);
    const clientId = clientIndex + 1; //set client ID

    sendMessage(socket, ['client-id', clientId]);
    Max.outlet('client-connect', clientId); //Max console print

    const clientCount = getClientCount(); //how many clients are connected
    Max.outlet('client-count', clientCount);

    socket.on('message', (message) => {
        const incoming = JSON.parse(message);
        Max.outlet(incoming);
        });

    socket.on('close', () => {
        if (removeClientFromList(socket) !== null) {
            Max.outlet('client-disconnect', clientId);

            const clientCount = getClientCount();
            Max.outlet('client-count', clientCount);
        }
    });
});