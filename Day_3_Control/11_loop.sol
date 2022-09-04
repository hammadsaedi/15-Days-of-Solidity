// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Iterations {
    /*
    Solidity supports
        for
        while
        do while

    Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.
    For the reason above, while and do while loops are rarely used.
    */

    // For Loop
    function gweiToWei(uint n) pure public returns (uint){
        uint _gwei = 0; 
        for(uint i = 0; i < n; i++){
            _gwei += 10**9; 
        }
        return _gwei;
    }

    // While Loops
    // Let's go with gas fee again
    uint public score;
    function gasFeeTest() public { 
        // Function was declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
        uint temp = msg.sender.balance;
        while(msg.sender.balance >= temp){
            score++; // Function cannot be declared as view because this expression (potentially) modifies the state.
        }
    } // Not Responding

    // Another idea. To play with while Loop; State Level Updates.
    function addScore(uint n) public {
        while (n != 0) {
            score++;
            n--; 
        }
    }

    // Do While Loops
    function addScoreV2(uint n) public { // For first 10 call; score can be incemented one time
        do {
            score++;
            n--;
        } while(score > 10 && n != 0);
    }

    // Nested Loops
    // What to do?
    function multiply(uint x, uint y) pure public returns (uint) { 
        uint n;
        for(uint i = 0; i < x; i++){
            for(uint j = 0; j < y; j++){
                n++;
            }
        }
        return n;
    }

    // continue
    function subtract(uint x, uint y) pure public returns (int) { 
        // Its unsigned subtaction; 1 - 2 == 0
        // In built in uint subtraction 1 - 2 throw error
        int n;
        for(uint i = 0; i < x; i++){
            if (y != 0){
                y--;
                continue;
            }
            n++;
        }
        return n;
    }

    // breaks
    uint constant LIMIT = 6;
    function addScoreV3(uint n) public {
        for(uint i = 0; i < n; i++){
            if (i == LIMIT) break;
            score++;
        }
    } 
}