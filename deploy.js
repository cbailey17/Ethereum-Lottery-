const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('../compile');
const provider = new HDWalletProvider(

);
const web3 = new Web3(provider);

