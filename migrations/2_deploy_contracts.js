const Random = artifacts.require('random')

module.exports = function(deployer) {
    deployer.deploy(Random)
}