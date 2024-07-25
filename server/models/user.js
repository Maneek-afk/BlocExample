const mongoose= require('mongoose');

const userSchema=mongoose.Schema({

    name:{
        required: true,
        type: String,
        trim: true,
    },

    email:{
        required:true,
        type:String,
        trim:true,
        unique:true,
        validate:{
            validator:(value)=>{
                const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message:'Please enter valid email address'
        }
    },

    password:{
        required:true,
        type:String,validate:{
            validator:(value)=>{
                return value.length > 6;
            },
            message:'Please enter a long password'
        }
    }

})

const User = mongoose.model("user",userSchema);

module.exports=User;