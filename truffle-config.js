module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Localhost for Ganache
      port: 7545, // Ganache default RPC port
      network_id: "*" // Match any network ID
    }
  },
  compilers: {
    solc: {
      version: "0.8.21" // Ensure it matches your Solidity version
    }
  }
};
