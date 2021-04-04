const HDWalletProvider = require("@truffle/hdwallet-provider");
const {API_URL} = process.env
const {PRIVATE_KEY} = process.env

module.exports = {
  compilers: {
    solc: {
      version: "^0.6.6"
  
    }
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "5777",
    },
    kovan: {
      provider: function() {
        return new HDWalletProvider(
          //private keys array
          [PRIVATE_KEY],
          API_URL
        )
      },
      gas: 5000000,
      gasPrice: 25000000000,
      network_id: 42
    }
  }
};
