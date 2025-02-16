const { Web3 } = require("web3");
require("dotenv").config();

// BSC Mainnet & Testent RPC
const BSC_RPC = process.env.BSC_RPC_URL || "https://bsc-dataseed.binance.org/";

const web3 = new Web3(BSC_RPC);

module.exports = web3;
