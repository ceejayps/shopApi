// Importing necessary modules
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


