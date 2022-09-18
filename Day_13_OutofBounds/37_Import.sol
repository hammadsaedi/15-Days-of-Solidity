// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Importing local files
import "Day_12_Dead/35_ContractFactory.sol";
// We can use this file as if it is present in this this file
// Extend it. Implement it. Use it. Or What ever you want ot do.

// importing external files 
// https://wizard.openzeppelin.com/
// To make contract by OpenZeppelin standard 

// https://www.youtube.com/watch?v=0Dby_DpEoQY&ab_channel=SmartContractProgrammer

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/Pausable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract HelloWorld is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("Hello World", "HELL") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}