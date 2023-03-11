import User from '../models/user.js';

// GET /users
const getUsers = async (req, res) => {
  try {
    const users = await User.find();
    res.status(200).json(users);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

// POST /users
const createUser = async (req, res) => {
  const user = req.body;

  const newUser = new User(user);

  try {
    await newUser.save();
    res.status(201).json(newUser);
  } catch (error) {
    res.status(409).json({ message: error.message });
  }
};

// GET /users/:id
const getUserById = async (req, res) => {
  const { id } = req.params;

  try {
    const user = await User.findById(id);
    res.status(200).json(user);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

// PUT /users/:id
const updateUserById = async (req, res) => {
  const { id } = req.params;
  const { name, email, password, dateOfBirth } = req.body;

  if (!mongoose.Types.ObjectId.isValid(id)) {
    return res.status(404).send(`No user with id: ${id}`);
  }

  const updatedUser = { name, email, password, dateOfBirth, _id: id };

  try {
    await User.findByIdAndUpdate(id, updatedUser, { new: true });
    res.status(200).json(updatedUser);
  } catch (error) {
    res.status(409).json({ message: error.message });
  }
};

// DELETE /users/:id
const deleteUserById = async (req, res) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id)) {
    return res.status(404).send(`No user with id: ${id}`);
  }

  try {
    await User.findByIdAndRemove(id);
    res.status(200).json({ message: 'User deleted successfully' });
  } catch (error) {
    res.status(409).json({ message: error.message });
  }
};

export { getUsers, createUser, getUserById, updateUserById, deleteUserById };
