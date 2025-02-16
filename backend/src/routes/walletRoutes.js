const express = require("express");
const Wallet = require("../models/Wallet");
const { generateBSCWallet } = require("../utils/walletUtils");

const router = express.Router();

/**
 * @route POST /api/wallet/create
 * @desc Generate a unique wallet for a user
 * @access Public
 */

router.post("/create", async (req, res) => {
  try {
    const { userId } = req.body;

    if (!userId) {
      return res.status(400).json({ error: "User ID is required" });
    }

    // Check if the user already has a wallet
    const existingWallet = await Wallet.findOne({ userId });
    if (existingWallet) {
      return res.status(400).json({ error: "User already has a wallet" });
    }

    // Generate a new wallet
    const { address, privateKey } = generateBSCWallet();

    // Save the wallet to mongodb
    const newWallet = new Wallet({ userId, address, privateKey });
    await newWallet.save();

    res.json({ message: "Wallet created successfully", address });
  } catch (error) {
    console.error("Error generating wallet:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
