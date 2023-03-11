import mongoose from 'mongoose';
const db = async () => {
  try {
    const connection = await mongoose.connect(process.env.MONGODB_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log();
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

export default db;
