const Random = artifacts.require('RandomNumberGenerator')

module.exports = function(deployer) {
    deployer.deploy(Random)
}