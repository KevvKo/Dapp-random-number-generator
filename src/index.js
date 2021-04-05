require('dotenv').config()
const contract = require('../build/contracts/RandomNumberGenerator.json')
const Web3 = require('web3')

const { API_URL, CONTRACT_ADDRESS } = process.env
const web3 = new Web3(API_URL)

const randomNumberGenerator = new web3.eth.Contract(contract.abi, CONTRACT_ADDRESS)