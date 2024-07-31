const User = require('../models/user');

// Function to get username from userId
const getUsernameById = async (userId) => {
    try {
        const user = await User.findOne({ _id: userId });
        if (!user) {
            throw new Error('User not found');
        }
        return user.name;  // Use the field name as defined in your schema
    } catch (error) {
        console.error(error);
        throw new Error('Error fetching username');
    }
};

module.exports = { getUsernameById };
