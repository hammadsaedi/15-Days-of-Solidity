// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Immutable {
    // Immutable
    // Immutable variables are like constants. 
    // Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
    address immutable MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc; // Immutable can be set while declaration//
    address immutable CALLER_ADDRESS;
    // without public keyword, these are not modified. By default they are private? Or may be not?
    
    // int immutable num;  
    // Immutable variables must be initialized using an assignment.
    // means there is no default value like noraml int has 0; We cannot just increment it in constructor

    constructor() { // creates object of class in JAVA. Here, construct contract
        CALLER_ADDRESS = msg.sender;
        // num++; // Immutable variables must be initialized using an assignment.

    } 
    //Construction control flow ends without initializing all immutable state variables.

    
    // constructor overloading?
    // Here, we try:
    // constructor(int num) { //ERROR: // More than one constructor defined.
    //     CALLER_ADDRESS = msg.sender;
    //  }
    // Not supported
    

    // constructor

}