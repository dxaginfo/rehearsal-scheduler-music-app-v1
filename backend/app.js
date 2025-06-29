const express = require('express');
const app = express();
app.use(express.json());
app.get('/', (req, res) => res.send('Rehearsal Scheduler API'));
module.exports = app;
