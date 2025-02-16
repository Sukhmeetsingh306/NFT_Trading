require("dotenv").config();
const express = require("express");
const connectDB = require("./config/database");
const authRoutes = require("./routes/authRoutes");

const walletRoutes = require("./routes/walletRoutes");
const { checkDeposits } = require("./utils/transactionTracker");

const app = express();
app.use(express.json());

connectDB();
console.log("Starting transaction monitoring...");
checkDeposits(); // Initial run

app.use("/api/auth", authRoutes);
app.use("/api/wallet", walletRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
