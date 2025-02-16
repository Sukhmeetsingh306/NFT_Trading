const mongoose = require("mongoose");

const WalletSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true,
    ref: "User",
  }, // Link to the User model (if you have one)
  address: { type: String, required: true, unique: true }, // User's unique BSC wallet address
  privateKey: { type: String, required: true }, // Private key for this wallet (encrypt this in production)
  balance: {
    type: mongoose.Types.Decimal128,
    default: mongoose.Types.Decimal128.fromString("0.00"),
  }, // Store with 2 decimal places
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model("Wallet", WalletSchema);
