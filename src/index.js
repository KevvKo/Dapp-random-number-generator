require('dotenv').config()
const contract = require('../build/contracts/Random.json')
const Web3 = require('web3')

const { API_URL, CONTRACT_ADDRESS } = process.env
const web3 = new Web3(API_URL)

const randomContract = new web3.eth.Contract(contract.abi, CONTRACT_ADDRESS)

const main = async () => {
    // getRandomNumberWithoutOracle()
    // requestRandomNumber()
    getRandomNumber()
}

const getRandomNumberWithoutOracle = async () => {
    const randomNumber = await randomContract.methods.getRandomNumberWithoutOracle().call()
    console.log(`Random number with an unsecure implemenation: ${randomNumber}`)
}

const requestRandomNumber = async () => {
    await randomContract.methods.getRandomNumber(342343242).call()
}

const getRandomNumber = async () => {
    const randomNumber = await randomContract.methods.randomNumber()
    console.log(`Random number with chainlink: ${randomNumber}`)
    
}

main()