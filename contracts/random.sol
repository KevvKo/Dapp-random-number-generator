// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract Random is VRFConsumerBase{
    
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomNumber;

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

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomNumber = randomness;
    }
    
    // returns a random number based on an oracle
    function getRandomNumber(uint256 userProvidedSeed) public returns (bytes32 requestId){
        require(LINK.balanceOf(address(this)) > fee, 'Transaction canceled - not enough LINK');      
        return requestRandomness(keyHash, fee, userProvidedSeed);
    }

    // returns a "random" number based on an unsecure pattern
    function getRandomNumberWithoutOracle() public view  returns (uint256) {
        return uint256(keccak256(abi.encodePacked( now, msg.sender)));
    }
}