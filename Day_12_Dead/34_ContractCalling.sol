// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Calling Other Contract
 * Contract can call other contracts in 2 ways.
 * 
 * The easiest way to is to just call it, like A.foo(x, y, z).
 * Another way to call other contracts is to use the low-level call.
 * This method is not recommended.
*/

// https://www.youtube.com/watch?v=6aQErpWPLbk&ab_channel=SmartContractProgrammer

contract Callee {
    uint public x;
    uint public value;
    
    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns(uint) {
        return x;
    }

    function setXPremium(uint _x) external payable {
        x = _x;
        value = msg.value;
    }
}

contract Caller {
    function setX(Callee callee, uint _x) public { // Passing contract address 
        callee.setX(_x); // It's like instantiating object of class and setting value of feild by . operator?
        // But how to instantiate object here? 
    }

    function setXByAddress(address _address, uint _x) public {
        Callee callee = Callee(_address); // from address to object?
        callee.setX(_x);
    }

    function setXPremium(Callee callee, uint _x) payable public {
        callee.setXPremium{value: msg.value}(_x);
    }

    function getX(Callee callee) external view returns (uint) {
        return callee.getX();
    }
}

// Contract address is like reference varibale of contract (object)
// Pass it in function param
// Use it as We use reference varibale in java to call function and feilds of object
