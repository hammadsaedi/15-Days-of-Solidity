// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract State {
    /**
     * Reading and Writing to a State Variable
     * To write or update a state variable you need to send a transaction.
     * On the other hand, you can read state variables, for free, without any transaction fee.
    */

    // state variable
    uint private num;

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint){ // Function state mutability can be restricted to view
        return num;
    }

    // You need to send a transaction to write to a state variable.
    function set(uint _num) public { // This declaration shadows an existing declaration. {if pram is same as satate variable name}
        num = _num;
    }
}