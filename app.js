const express = require('express');
const http = require('http');
const path = require('path');
const cors = require('cors')

const app = express();

const port = process.env.PORT || 3000;


// app.use(express.static(__dirname + '/dist'));

// app.get('/*', (req, res) => res.sendFile(path.join(__dirname)));

app.use(cors());

app.get('/test', (req, res) => res.send(`{ "db_user": "${process.env.DB_USER}", "db_password": "${process.env.DB_PASSWORD}", "db_url": "${process.env.DB_URL}" }`));

const server = http.createServer(app);

server.listen(port, () => console.log(`App running on: http://localhost:${port}`));
