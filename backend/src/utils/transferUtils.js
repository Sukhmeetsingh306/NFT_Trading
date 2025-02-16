const web3 = require("../config/web3");
require("dotenv").config();

const MAIN_WALLET_ADDRESS = process.env.MAIN_WALLET_ADDRESS;

// USDT Contract ABI (Minimal)
const USDT_CONTRACT = process.env.USDT_CONTRACT;
const USDT_ABI = [
  {
    constant: false,
    inputs: [
      { name: "_to", type: "address" },
      { name: "_value", type: "uint256" },
    ],
    name: "transfer",
    outputs: [{ name: "", type: "bool" }],
    type: "function",
  },
];

// Load USDT contract
const usdtContract = new web3.eth.Contract(USDT_ABI, USDT_CONTRACT);

/**
 * Auto-transfer BNB from user wallet to the main wallet
 */
const autoTransferBNB = async (walletAddress, privateKey, amount) => {
  try {
    const amountInWei = web3.utils.toWei(amount.toString(), "ether");

    // ✅ Check wallet balance before proceeding
    const balance = await web3.eth.getBalance(walletAddress);
    const balanceInBNB = web3.utils.fromWei(balance, "ether");
    console.log("Wallet BNB Balance:", balanceInBNB);

    // ✅ Get dynamic gas fee estimation
    const gasPrice = await web3.eth.getGasPrice();
    const gasLimit = 21000; // Standard BNB transfer
    const estimatedGasFee = BigInt(gasPrice) * BigInt(gasLimit);

    // ✅ Ensure wallet has enough BNB for transfer + gas fees
    if (BigInt(balance) < BigInt(amountInWei) + estimatedGasFee) {
      console.error(
        `🚨 Insufficient BNB balance! Need at least ${web3.utils.fromWei(
          (BigInt(amountInWei) + estimatedGasFee).toString(),
          "ether"
        )} BNB to proceed.`
      );
      return null;
    }

    const transaction = {
      from: walletAddress,
      to: MAIN_WALLET_ADDRESS,
      value: amountInWei,
      gas: gasLimit,
      gasPrice,
    };

    // ✅ Sign the transaction
    const signedTx = await web3.eth.accounts.signTransaction(
      transaction,
      privateKey
    );

    // ✅ Send transaction
    const receipt = await web3.eth.sendSignedTransaction(
      signedTx.rawTransaction
    );
    console.log(
      `✅ BNB Transferred: ${amount} BNB from ${walletAddress} to ${MAIN_WALLET_ADDRESS}`
    );
    console.log("🔗 Transaction Hash:", receipt.transactionHash);

    return receipt.transactionHash;
  } catch (error) {
    console.error("🚨 BNB Transfer Error:", error.message);
    return null;
  }
};

/**
 * Auto-transfer USDT from user wallet to the main wallet
 */
const autoTransferUSDT = async (walletAddress, privateKey, amount) => {
  try {
    const amountInWei = web3.utils.toWei(amount.toString(), "ether");

    // Estimate Gas
    const gasLimit = await usdtContract.methods
      .transfer(MAIN_WALLET_ADDRESS, amountInWei)
      .estimateGas({ from: walletAddress });

    const tx = {
      from: walletAddress,
      to: USDT_CONTRACT,
      data: usdtContract.methods
        .transfer(MAIN_WALLET_ADDRESS, amountInWei)
        .encodeABI(),
      gas: gasLimit,
    };

    // Sign Transaction
    const signedTx = await web3.eth.accounts.signTransaction(tx, privateKey);

    // Send Transaction
    const receipt = await web3.eth.sendSignedTransaction(
      signedTx.rawTransaction
    );
    console.log(
      `✅ USDT Transferred: ${amount} USDT from ${walletAddress} to ${MAIN_WALLET_ADDRESS}`
    );
    console.log("🔗 Transaction Hash:", receipt.transactionHash);

    return receipt.transactionHash;
  } catch (error) {
    console.error("🚨 USDT Transfer Error:", error.message);
    return null;
  }
};

module.exports = { autoTransferBNB, autoTransferUSDT };
