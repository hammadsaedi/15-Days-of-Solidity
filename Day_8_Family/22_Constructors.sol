// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// special function which are called when contract is deployed
// Used mainly to define state varaible

// https://www.youtube.com/watch?v=7XwWBr4TAz4&ab_channel=SmartContractProgrammer 

// https://www.youtube.com/watch?v=ADVifGOanVU&ab_channel=EatTheBlocks
// Initilazation Logic

// contructor is called once; cannot call after deployement within same contract


contract Constructor {
    address public owner;
    uint immutable public DOB; // Construction control flow ends without initializing all immutable state variables.
    string public name;
    bool public alive;

    // constructor
    constructor(string memory _name) { // In calldata case: Data location must be "storage" or "memory" for constructor parameter, but "calldata" was given.
        owner = msg.sender;
        // DOB = now; // "now" has been deprecated. Use "block.timestamp" instead.
        DOB = block.timestamp;
        name = _name;
        // there is not this keyword like it works in JAVA;
        life(); // contructor can call other functions
    }
    // prams cannot be call data

    // contractor over loading is not allowed
    // constructor() { // More than one constructor defined.
    // }

    function life() public {
        alive = !alive;
    }

    // Only Public / Internal is allowed

    // Internal contract cannot be deployed directly
    // Called by another contract

    // Cannot be external or private

}