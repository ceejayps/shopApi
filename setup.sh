#!/bin/bash

# Create the main directories
mkdir controllers models routes public utils

# Create the config directory and database.js file
mkdir config
touch config/database.js

# Add database.js
touch config/database.js

# Add MongoDB connection code to database.js
echo "import mongoose from 'mongoose';
const db = async () => {
  try {
    const connection = await mongoose.connect(process.env.MONGODB_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log(`MongoDB connected to ${connection.connection.host}`);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

export default db;" > config/database.js

# Create the env file
touch .env

# Add PostgreSQL environment variables to env file
echo "DB_USER=username" >> .env
echo "DB_PASSWORD=password" >> .env
echo "DB_HOST=localhost" >> .env
echo "DB_PORT=5432" >> .env
echo "DB_DATABASE=mydatabase" >> .env
echo "MONGODB_URI=mongodb://localhost/demoApp"

# Create the views directory
mkdir views

#!/bin/bash

# Initialize the project with npm init
npm init -y

# Set the type field to module in the package.json file
npm config set type module

# Install the required packages
npm install bcrypt body-parser cors dotenv express helmet jsonwebtoken morgan pg --save

npm install nodemon --save-dev

# Add nodemon script to package.json
npm set-script dev "nodemon server.js"


# Create the server.js file
touch server.js

# Add PostgreSQL connection import to server.js

echo "Creating the server.js file..."

# Create the server.js file
touch server.js

echo "// Importing necessary modules
import express from 'express';
import morgan from 'morgan';
import helmet from 'helmet';
import cors from 'cors';
import bodyParser from 'body-parser';
import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

// Importing database connection file
import db from './config/database.js'

// Initializing Express server
const server = express();

// Setting port
const port = process.env.PORT ?? 3000;

// Configuring environment variables
dotenv.config();

// Using security-related middlewares
server.use(helmet());
server.use(helmet.crossOriginResourcePolicy({policy:'cross-origin'}));

// Using middlewares for body parsing
server.use(bodyParser.json());
server.use(bodyParser.urlencoded({extended:false}));

// Using morgan for logging HTTP requests
server.use(morgan('dev'));

// Using CORS
server.use(cors());

// Route for root directory
server.get('/', (req, res) => res.send('Hello World!'));

// Starting the Express server
server.listen(port, () => console.log('Example server listening on port ', port));

" > server.js


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
npm run dev
