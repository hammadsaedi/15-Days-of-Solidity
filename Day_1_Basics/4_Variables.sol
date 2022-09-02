// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Variable {
    /**
     * There are 3 types of variables in Solidity
     * local:
     * declared inside a function not stored on the blockchain
     * state:
     * declared outside a function stored on the blockchain
     * global (provides information about the blockchain)
    */

    // state variables
    string public text = "Mango";
    int public x; 

    // Function state mutability can be restricted to pure
    // Whot is pure?
    // dis-allow modification and access of state 
    function num() pure public returns (uint){
        uint i = 19;
        // local variables cannot be public etcs? right?
        return i;
    }

    // Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
    // this method cannot be pure. As, it access the state i.e. Global Variable. Can be pure. Ok? 
    function time() view public returns (uint){
        uint timeStamp = block.timestamp;
        // local variables cannot be public etcs? right?
        return timeStamp;

        // timeStamp is local variable
        // block.timestamp is global variable. I think so. LOL.
    }

    function myAddress() public view returns (address){
        return msg.sender; // Global Variable // return address of caller of method
    }



    // Random Number in Solidity?
    // Solidity is not capable of creating random numbers. 
    // Actually, every algorithm for creating random numbers is pseudorandom — no language is capable of creating completely random numbers. 
    // The problem with Solidity is that complex algorithms cost too much, so more basic solutions are used.
}