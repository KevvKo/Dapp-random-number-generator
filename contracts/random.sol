pragma solidity ^0.6.6;
import "https://raw.githubusercontent.com/smartcontractkit/chainlink/master/evm-contracts/src/v0.6/VRFConsumerBase.sol";

contract RandomNumberGenerator is VRFConsumerBase{
    
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 randomNumber;

    constructor()
    
    VRFConsumerBase(
        0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, 
        0xa36085F69e2889c224210F603D836748e7dC0088
    )
    
    public
    {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4; 
        fee = 0.1 * 10 ** 18;
    }

    function getRandomNumberBySeed(uint256 userProvidedSeed) public returns (bytes32 requestId){
        require(LINK.balanceOf(address(this)) > fee, 'Transaction canceled - not enough LINK');        
        return requestRandomness(keyHash, fee, userProvidedSeed);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomNumber = randomness;
    }
    
    // returns a "random" number based on an unsecure pattern
    function getBadRandomNumber() public returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked( block.timestamp, block.difficulty))));
    }

    function getRandomNumber() public returns (bytes32 request) {
        require(LINK.balanceOf(address(this)) > fee, 'Transaction canceled - not enough LINK');        
        uint256 badRandomNumber = uint256(this.getBadRandomNumber());
        return requestRandomness(keyHash, fee, badRandomNumber);
    }
}