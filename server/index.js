const express = require('express');
const mongoose= require('mongoose');

const authRouter=require("./routes/auth")

const PORT = 3000;
const app = express();
const DB="mongodb+srv://manikttmg11:r5rBdGixDzA52SdZ@cluster0.faxt2nb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

//middleware
app.use(express.json())
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