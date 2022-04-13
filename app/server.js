//server.js
const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';
const app = require("./app");

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
