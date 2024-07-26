//"mongodb+srv://manikttmg11:r5rBdGixDzA52SdZ@cluster0.faxt2nb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

const express = require('express');
const mongoose = require('mongoose');
const authRouter = require("./routes/auth");
const bodyParser = require('body-parser');

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://manikttmg11:r5rBdGixDzA52SdZ@cluster0.faxt2nb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Middleware
app.use(bodyParser.json()); // Add this line to use body-parser
app.use(authRouter);

mongoose.connect(DB)
    .then(() => {
        console.log("Database connected");
    })
    .catch((e) => {
        console.error("Database connection error:", e.message);
    });

app.listen(PORT, () => {
    console.log(`Server connected to port ${PORT}`);
});

