const express = require("express");
const User = require("../models/user")
const authRouter = express.Router();
const bcrypt = require('bcrypt');

authRouter.post("/api/signup", async (req,res) => {
    try {
        const {name,email,password} = req.body;
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg: "User with same email already exists!"});
        }

       const hashedPassword = await bcrypt.hash(password,8);

        let user = new User({
            email,
            password:hashedPassword,
            name,
        })
        user =await user.save();
        res.json(user);
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: e.message});
    }
      
})

module.exports = authRouter;                                               


