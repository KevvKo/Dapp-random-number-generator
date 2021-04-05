require('dotenv').config()
const contract = require('../build/contracts/Random.json')
const Web3 = require('web3')

const { API_URL, CONTRACT_ADDRESS, PUBLIC_KEY } = process.env
const web3 = new Web3(API_URL)

const randomContract = new web3.eth.Contract(contract.abi, CONTRACT_ADDRESS)

const main = async () => {
    getBadRandomNumber()
    //getRandomNumberBySeed(2334242)
    //getRandomNumber()
}

const getBadRandomNumber = async () => {
    const badRandomNumber = await randomContract.methods.getBadRandomNumber().call()
    console.log(`Random number with an unsecure implemenation: ${badRandomNumber}`)
}

const getRandomNumberBySeed = async (providedSeed) => {
    const randomNumberWithSeed = await randomContract.methods.getRandomNumberBySeed(providedSeed).call()
    console.log(`Random number with an user provided seed: ${randomNumberWithSeed}`)
}

const getRandomNumber = async () => {
    const randomNumber = await randomContract.methods.getRandomNumber().call()
    console.log(`Random number as a combination of the previous methods: ${randomNumber}`)
}

main()