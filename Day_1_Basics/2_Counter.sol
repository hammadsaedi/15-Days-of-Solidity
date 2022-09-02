// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Counter {
    // Sate Variable to hold counts
    // int private count = 0;
    int private count; // can be undecalred? O yes. It's default value in 0. Just as No-Primitive in JAVA? LOL.
    // Initilally, its zero
    // Using INT; SO, it can also hold negative numbers. But, What if? we use uint (Unsingend Integer?) and decrement it? Let's see
    /**
     * 
     * [vm]from: 0x5B3...eddC4to: Counter.decrement() 0x93f...C96CCvalue: 0 weidata: 0x2ba...eceb7logs: 0hash: 0x0e6...72945
     * transact to Counter.decrement errored: VM error: revert.
     * revert
     * The transaction has been reverted to the initial state.
     * Note: The called function should be payable if you send value and the value you send should be less than your current balance.  
     * Debug the transaction to get more information.
     */

    /**
     * While uning memory after int in returns:
     * Data location can only be specified for array, struct or mapping types, but "memory" was given.
     * Because int is neither array, nor struct nor mapping nor string.
    */
    function getCount() public view returns (int){ // Does view function cost gass fee? On Rimix, it says yes.?
        return count;
    }

    // incrementer
    function increment() public {
        count++;
    }

    // decrementer
    function decrement() public {
        count--;
    }
    // This function will fail if count = 0 if we use unit
}