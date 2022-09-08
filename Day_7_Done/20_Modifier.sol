// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  ^0.8.13;

/**
 * Modifiers are code that can be run before and / or after a function call.
 * Modifiers can be used to:
 *      Restrict access
 *      Validate inputs
 *      Guard against reentrancy hack
*/

// https://www.youtube.com/watch?v=thADMg9cKPM&ab_channel=SmartContractProgrammer

contract Modofire {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // transaction call --- deployer
        owner = msg.sender;
    }

    // modifier to check caller is owner of contract
    modifier OnlyOwner() {
        require(msg.sender == owner, "Function can only be called by Owner.");
        _;
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
    }

    // modifier can take input to validate
    modifier validAddress(address _address) {
        require(_address != address(0), "Cannot transact to Null Address.");
        // check if address passed is valid; Cannot be Zero Address, Burn, Dead etc
        _;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No Re Entrancy");
        locked = true;
        // if locked value is false, it set lock to true So, function will not be able to called again
        _;
        locked = false;
        // What's purpose of this?
        // after completing execution of function decrement(uint i) public noReentrancy it reset locked to false. 
        // Otherwise it will remain true
        // it prevents recursion? Right. Can be used elsewhere

    }


    // Functions
    
    // Change owner;
    function transferOwnerShip(address _address) 
        public // publically accessiable
        OnlyOwner  // Only Owner can call, rest will be reverted
        validAddress(_address) { // Onwership can not be transfer to Null Address
            owner = _address;
    }


    function decrement(uint i) public noReentrancy { 
        // can only decrease 1
        x -= i;

        // if i > 1 is passed it will try recursion 
        // (Re-Entrancy) Not alowed
        // So transaction will be reverted
        if (i > 1) {
            decrement(i - 1);
        }
        // If there is an error, all the changes to state var will be reverted
        // if x = 2:
        // then x -= 2  == 8
        // a recursive call
        // and boom and error
        // revert x = 8 to x = 10
    }
}

// Other than modifier
// Function can be used with same require statements
// if they got exetuted without error then do other stuff
/*
    function transferOwnerShip(address _address) public { 
        OnlyOwner();
        validAddress(_address);
        owner = _address;
    }

    function OnlyOwner() {
        require(msg.sender == owner, "Function can only be called by Owner.");
    }

    function validAddress(address _address) {
        require(_address != address(0), "Cannot transact to Null Address.");
    }
*/
// But modifiers are Fancy. LOL. 