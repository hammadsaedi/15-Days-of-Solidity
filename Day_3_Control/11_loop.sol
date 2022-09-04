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


    // Do While Loops

    // Nested Loops

    // continue

    // breaks
}