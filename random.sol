pragma solidity >=0.4.16 <0.9.0;

import "github.com/provable-things/ethereum-api/provableAPI_0.5.sol";

contract RandomNumberGenerator is usingProvable {

    event LogNewContract(string message);
    event generatedRandomNumber(uint256 number);

    constructor(){
        generatedRandomNumber();
    }

    function randomNumber() public {

    }
}