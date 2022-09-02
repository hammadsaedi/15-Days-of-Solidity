// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Constant {
    uint constant public PI = 3;  // coding convention to uppercase constant variables
    // Solidity has no floating point number. 
    // So Sad. haha. 
    // Floating Point Sucks a lot. Dont you know?
    // Ether, Gewi, Wei? blah blah.


    // address public constant MY_ADDRESS = msg.sender; 
    // Initial value for constant variable has to be compile-time constant.
    // msg.sender; is run time. Very Amazing.

    address constant private MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    // works fine

    address constant MINE_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    // works fine

    address ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    // works fine

    uint x = 10;
    // works fine
    // Means for state variable access modifire is not mendatory. But, it shows erorr or just warning in methods?
    
    //No visibility specified. Did you intend to add "public"?
    // function get(){}

}