import express from 'express';
import { getUsers, createUser, getUserById, updateUserById, deleteUserById } from '../controllers/users.js';

const router = express.Router();

// GET /users
router.get('/', getUsers);

// POST /users
router.post('/', createUser);

// GET /users/:id
router.get('/:id', getUserById);

// PUT /users/:id
router.put('/:id', updateUserById);

// DELETE /users/:id
router.delete('/:id', deleteUserById);

export default router;
