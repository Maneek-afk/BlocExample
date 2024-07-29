const express = require('express');
const User = require("../models/user");
const bcrypt = require('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

// Test Route
authRouter.get("/api/test", (req, res) => {
    console.log("successful");
});

// Signup
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: "User with similar email exists" });
        }

        const hashedPassword = await bcrypt.hash(password, 8);
        let user = new User({
            name,
            email,
            password: hashedPassword,
        });
        user = await user.save();

        const token = jwt.sign({ id: user._id }, "password key", { expiresIn: "1h" });
        res.json({ id: user._id, token });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Sign In
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;

        // Check for existing email
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with email doesn't exist" });
        }

        // Compare password
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect Password" });
        }
        const token = jwt.sign({ id: user._id }, "password key", { expiresIn: "1d" });
        res.json({ token, id: user._id });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;
