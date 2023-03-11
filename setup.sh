#!/bin/bash

# Create the main directories
mkdir controllers models routes public utils

# Create the config directory and database.js file
mkdir config
touch config/database.js

# Add PostgreSQL connection to database.js
echo "const { Pool } = require('pg');" >> config/database.js
echo "" >> config/database.js
echo "const pool = new Pool({" >> config/database.js
echo "  user: process.env.DB_USER," >> config/database.js
echo "  host: process.env.DB_HOST," >> config/database.js
echo "  database: process.env.DB_DATABASE," >> config/database.js
echo "  password: process.env.DB_PASSWORD," >> config/database.js
echo "  port: process.env.DB_PORT," >> config/database.js
echo "});" >> config/database.js
echo "" >> config/database.js
echo "module.exports = {" >> config/database.js
echo "  query: (text, params) => pool.query(text, params)," >> config/database.js
echo "};" >> config/database.js

# Create the env file
touch .env

# Add PostgreSQL environment variables to env file
echo "DB_USER=username" >> .env
echo "DB_PASSWORD=password" >> .env
echo "DB_HOST=localhost" >> .env
echo "DB_PORT=5432" >> .env
echo "DB_DATABASE=mydatabase" >> .env

# Create the views directory
mkdir views

# Create the package.json file
npm init -y

# Install express and pg
npm install express pg

# Create the server.js file
touch server.js

# Add PostgreSQL connection import to server.js
echo "const db = require('./config/database');" >> server.js
echo "" >> server.js

# Add the Express server to server.js
echo "const express = require('express');" >> server.js
echo "const app = express();" >> server.js
echo "" >> server.js
echo "app.get('/', async (req, res) => {" >> server.js
echo "  const result = await db.query('SELECT $1::text as message', ['Hello, World!']);" >> server.js
echo "  const message = result.rows[0].message;" >> server.js
echo "  res.send(message);" >> server.js
echo "});" >> server.js
echo "" >> server.js
echo "const port = process.env.PORT || 3000;" >> server.js
echo "app.listen(port, () => {" >> server.js
echo "  console.log('Server listening on port ' + port);" >> server.js
echo "});" >> server.js

# Create the bin/www file
mkdir bin
touch bin/www

# Create the routes/users.js file
touch routes/users.js

# Create the controllers/users.js file
touch controllers/users.js

# Create the models/user.js file
touch models/user.js

# Initialize a git repository
git init

# Create a .gitignore file
echo "node_modules" >> .gitignore
echo ".env" >> .gitignore
