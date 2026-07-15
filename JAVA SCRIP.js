const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Static folder for uploads
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Routes (Import route files)
const authRoutes = require('./routes/authRoutes');
const postRoutes = require('./routes/postRoutes');
const ppdbRoutes = require('./routes/ppdbRoutes');
const staffRoutes = require('./routes/staffRoutes');

app.use('/api/auth', authRoutes);
app.use('/api/posts', postRoutes);
app.use('/api/ppdb', ppdbRoutes);
app.use('/api/staff', staffRoutes);

// Root endpoint
app.get('/', (req, res) => {
    res.json({ message: "Welcome to SMP NU TUGASARI API" });
});

// Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});