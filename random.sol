pragma solidity ^0.5.0;

contract RandomNumberGenerator {

    uint256 randomNumber;

    constructor() public {}

    function badRandomNumber() public returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked( block.timestamp))));
    }
}