const axios = require("axios");
require("dotenv").config();

const USDT_CONTRACT = process.env.USDT_CONTRACT; // USDT contract address
const BSCSCAN_API_KEY = process.env.BSCSCAN_API_KEY;
const BSCSCAN_API_URL = "https://api.bscscan.com/api";

if (!USDT_CONTRACT || !BSCSCAN_API_KEY) {
  console.error("❌ Missing environment variables! Check your .env file.");
  process.exit(1);
}

// Function to fetch transactions for a given wallet
const getTransactions = async (walletAddress) => {
  try {
    const url = `${BSCSCAN_API_URL}?module=account&action=tokentx&contractaddress=${USDT_CONTRACT}&address=${walletAddress}&apikey=${BSCSCAN_API_KEY}`;

    console.log(`🔍 Fetching transactions from: ${url}`);

    const response = await axios.get(url);

    if (response.data.status !== "1") {
      console.warn(`⚠️ API Response Warning: ${response.data.message}`);
      return [];
    }

    return response.data.result || [];
  } catch (error) {
    console.error(`❌ Error fetching transactions: ${error.message}`);
    return [];
  }
};

// 🔹 Using the provided wallet address
const testWalletAddress = "0x0471D185cc7Be61E154277cAB2396cD397663da6";

// Run the test
getTransactions(testWalletAddress).then((txs) => {
  console.log(`📦 Fetched ${txs.length} Transactions:`, txs);
});
