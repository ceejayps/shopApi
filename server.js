const db = require('./config/database');

const express = require('express');
const app = express();

app.get('/', async (req, res) => {
  const result = await db.query('SELECT ::text as message', ['Hello, World!']);
  const message = result.rows[0].message;
  res.send(message);
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log('Server listening on port ' + port);
});
