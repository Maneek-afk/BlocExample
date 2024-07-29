const express = require('express');
const {Post} = require("../models/post");

const postRouter = express.Router();
const jwt = require('jsonwebtoken');

console.log(Post);

postRouter.post("/api/post",async (req,res)=>{
    try {

        const {userId,title,content,image}=req.body;

        if (!userId || !title || !content || !image) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        let post = new Post({
            userId,
            title,
            content,
            image
        });

        post =await post.save();
        console.log('Post saved:', post);
        res.status(201)
    } catch (error) {
        res.status(500).json({error:error.message});
    }
});

module.exports = postRouter;