const { Wallet } = require("@ethereumjs/wallet");

/**
 * Generate a new BSC wallet address and private key
 * @returns {Object} { address, privateKey }
 */
const generateBSCWallet = () => {
  const wallet = Wallet.generate(); // Generate a new wallet
  return {
    address: wallet.getAddressString(), // Public wallet address
    privateKey: wallet.getPrivateKeyString(), // Private key
  };
};

module.exports = { generateBSCWallet };
