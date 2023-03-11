import express from 'express';
const server = express();

server.get('/', async (req, res) => {
  
});

const port = process.env.PORT || 3000;
server.listen(port, () => {
  console.log('Server listening on port ' + port);
});
