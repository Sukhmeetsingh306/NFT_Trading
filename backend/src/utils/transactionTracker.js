const axios = require("axios");
const Wallet = require("../models/Wallet");
const web3 = require("../config/web3");
const { autoTransferBNB, autoTransferUSDT } = require("../utils/transferUtils");
const { decrypt } = require("../utils/encryptUtils");
require("dotenv").config();

const USDT_CONTRACT = process.env.USDT_CONTRACT;
const BSCSCAN_API_KEY = process.env.BSCSCAN_API_KEY;
const BSCSCAN_API_URL = "https://api.bscscan.com/api";

/**
 * Fetch BNB transactions from BscScan
 */
const getBNBTransactions = async (walletAddress) => {
  try {
    const url = `${BSCSCAN_API_URL}?module=account&action=txlist&address=${walletAddress}&apikey=${BSCSCAN_API_KEY}`;
    const response = await axios.get(url);
    return response.data.result || [];
  } catch (error) {
    console.error(`🚨 Error fetching BNB transactions: ${error.message}`);
    return [];
  }
};

/**
 * Fetch USDT (BEP-20) transactions from BscScan
 */
const getTokenTransactions = async (walletAddress) => {
  try {
    const url = `${BSCSCAN_API_URL}?module=account&action=tokentx&contractaddress=${USDT_CONTRACT}&address=${walletAddress}&apikey=${BSCSCAN_API_KEY}`;
    const response = await axios.get(url);
    return response.data.result || [];
  } catch (error) {
    console.error(`🚨 Error fetching token transactions: ${error.message}`);
    return [];
  }
};

/**
 * Monitor deposits & auto-transfer funds to the main wallet
 */
const checkDeposits = async () => {
  try {
    const wallets = await Wallet.find();

    for (const wallet of wallets) {
      const walletAddress = wallet.address;
      console.log(`🔍 Checking transactions for: ${walletAddress}`);

      // Decrypt Private Key
      const decryptedPrivateKey = decrypt(wallet.privateKey);

      // Fetch BNB transactions
      const bnbTxs = await getBNBTransactions(walletAddress);
      for (const tx of bnbTxs) {
        if (tx.to.toLowerCase() === walletAddress.toLowerCase()) {
          const amount = web3.utils.fromWei(tx.value, "ether");

          // Update balance in DB
          await Wallet.updateOne(
            { address: walletAddress },
            { $inc: { balance: parseFloat(amount) } }
          );
          console.log(
            `✅ BNB Deposit detected: ${amount} BNB to ${walletAddress}`
          );

          // Auto-transfer BNB
          const transferResult = await autoTransferBNB(
            walletAddress,
            decryptedPrivateKey,
            amount
          );
          if (transferResult) {
            console.log(
              `🚀 BNB Auto-transferred from ${walletAddress} to Main Wallet`
            );
          }
        }
      }

      // Fetch USDT transactions
      const tokenTxs = await getTokenTransactions(walletAddress);
      for (const tx of tokenTxs) {
        if (tx.to.toLowerCase() === walletAddress.toLowerCase()) {
          const amount = web3.utils.fromWei(tx.value, "ether");

          // Update balance in DB
          await Wallet.updateOne(
            { address: walletAddress },
            { $inc: { balance: parseFloat(amount) } }
          );
          console.log(
            `✅ USDT Deposit detected: ${amount} USDT to ${walletAddress}`
          );

          // Auto-transfer USDT
          const transferResult = await autoTransferUSDT(
            walletAddress,
            decryptedPrivateKey,
            amount
          );
          if (transferResult) {
            console.log(
              `🚀 USDT Auto-transferred from ${walletAddress} to Main Wallet`
            );
          }
        }
      }
    }
  } catch (error) {
    console.error(`🚨 Error checking deposits: ${error.message}`);
  }
};

// Run the tracker every 30 seconds
setInterval(checkDeposits, 30000);

module.exports = { checkDeposits };
