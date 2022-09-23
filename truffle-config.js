const HDWalletProvider = require('@truffle/hdwallet-provider');

const fs = require('fs');

const mnemonic = fs.readFileSync('mnemonic.json','utf-8');

module.exports = {
  networks: {

  goerliAlex: {
      network_id: "5",
      gasPrice: 5000000,
      provider: new HDWalletProvider(mnemonic, "https://goerli.infura.io/v3/bdc7f317cedb484da4d3953c54344944"),
      from: '0x5Dd1187ab3f21eFc415acE15d9f94d043948ed7F'
    },
    
  goerliBob: {
      network_id: "5",
      gasPrice: 5000000,
      provider: new HDWalletProvider(mnemonic, "https://goerli.infura.io/v3/bdc7f317cedb484da4d3953c54344944"),
      from: '0xbf7A496d4e1312Bb3895f34a5C7ceA951Cd1638F'
    },

  ropstenAlex: {
      network_id: "3",
      gasPrice: 5000000,
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/bdc7f317cedb484da4d3953c54344944"),
      from: '0x5Dd1187ab3f21eFc415acE15d9f94d043948ed7F'
    },

  ropstenBob: {
      network_id: "3",
      gasPrice: 5000000,
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/bdc7f317cedb484da4d3953c54344944"),
      from: '0xbf7A496d4e1312Bb3895f34a5C7ceA951Cd1638F'
    }
  },

  compilers: {
    solc: {
      version: "0.8.17"
    }
  }
};
