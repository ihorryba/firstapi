const express = require('express');
const http = require('http');
const path = require('path');
const cors = require('cors')

const app = express();

const port = process.env.PORT || 3001;

// app.use(express.static(__dirname + '/dist'));

// app.get('/*', (req, res) => res.sendFile(path.join(__dirname)));

app.use(cors());

app.get('/test', (req, res) => res.send('{ "data": "test" }'));

const server = http.createServer(app);

server.listen(port, () => console.log(`App running on: http://localhost:${port}`));