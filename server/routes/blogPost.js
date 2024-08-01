const express = require('express');
const {Post,Comment} = require("../models/post");
const { getUsernameById } = require('../controller/userController');

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

postRouter.post("/api/comment",async (req,res)=>{
    try {
                const { postId, userId, content } = req.body;

        if (!postId || !userId || !content) {
            return res.status(400).json({ message: 'All fields are required' });
        }

        const username = await getUsernameById(userId);  // Get username from userId

        const newComment = new Comment({
            postId,
            userId,
            username,  // Store the username with the comment
            content,
        });

        await newComment.save();

        await Post.findByIdAndUpdate(postId, {
            $push: { comments: newComment._id },
        });

        res.status(201).json({ message: 'Comment added successfully', comment: newComment });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Server error' });        
    }
})

postRouter.get("/api/getposts", async (req, res) => {
    try {
        const posts = await Post.find().populate('comments');
        res.status(200).json(posts);
        
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Server error' });
    }
});


module.exports = postRouter;