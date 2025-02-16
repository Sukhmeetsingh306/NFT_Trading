require("dotenv").config();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const User = require("../models/User");
const Wallet = require("../models/Wallet");
const { generateBSCWallet } = require("../utils/walletUtils");
const { encrypt, decrypt } = require("../utils/encryptUtils");

/**
 * @route POST /api/auth/signup
 * @desc Register a new user and automatically create a wallet
 */
const registerUser = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Check if user already exists
    let user = await User.findOne({ email });
    if (user) return res.status(400).json({ message: "User already exists" });

    // Hash the password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // Create and save user
    user = new User({ name, email, password: hashedPassword });
    await user.save();

    // Generate a BSC Wallet
    const { address, privateKey } = generateBSCWallet();

    // Encrypt private key before storing
    const encryptedPrivateKey = encrypt(privateKey);

    // Save wallet to DB
    const wallet = new Wallet({
      userId: user._id,
      address,
      privateKey: encryptedPrivateKey, // Encrypted private key
    });

    await wallet.save();

    res.status(201).json({ message: "User registered successfully!" });
  } catch (error) {
    res.status(500).json({ message: "Server Error", error: error.message });
  }
};

/**
 * @route POST /api/auth/login
 * @desc Authenticate user & return token
 */
const loginUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Find user
    const user = await User.findOne({ email });
    if (!user) return res.status(400).json({ message: "Invalid credentials" });

    // Check password
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch)
      return res.status(400).json({ message: "Invalid credentials" });

    // Fetch user's wallet balance
    const wallet = await Wallet.findOne({ userId: user._id });
    // const usdtBalance = wallet ? wallet.balance : 0;
    const usdtBalance = wallet.balance;

    const walletAddress = wallet ? wallet.address : null; // Ensure wallet exists

    // Generate JWT Token
    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
      expiresIn: "7d",
    });

    res.json({
      token,
      user: {
        id: user._id,
        name: user.name,
        email: user.email,
        walletAddress,
        usdtBalance, // Return wallet balance
      },
    });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
};

module.exports = { registerUser, loginUser };
