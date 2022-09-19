// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Cryptographic Hash Function
// https://www.youtube.com/watch?v=S9JGmA5_unY&ab_channel=3Blue1Brown

// Algorithm
// SHA256

// 2 ** 256 Guess for 256 bit and crack!

/**
 * Hashing with Keccak256
 * keccak256 computes the Keccak-256 hash of the input.
 * 
 * Some use cases are:
 * Creating a deterministic unique ID from a input
 * Commit-Reveal scheme
 * Compact cryptographic signature (by signing the hash instead of a larger input)
*/

// Version of SHA3
// https://www.youtube.com/watch?v=o8Wj0AfOk0c&ab_channel=WeWillCode

// Long explanation
// https://www.youtube.com/watch?v=bTOJ9An9wpE&ab_channel=BillBuchananOBE

// Simple and Easy
// https://www.youtube.com/watch?v=bYqbwB7j95U&ab_channel=BillBuchananOBE


// Test Site
// https://asecuritysite.com/Encryption/sha3



// Code
// https://www.youtube.com/watch?v=wCD3fOlsGc4&ab_channel=SmartContractProgrammer

contract Algo {
    function hash(address _address, uint amount, string calldata name) 
        public 
        pure 
        returns(bytes32) {
        // convert these into bytes
        // bytes passed to kaccak256 and there it return bytes32 
        return keccak256(abi.encodePacked(_address, amount, name));

    }
    // cryptographically 

    // Hash Collusion
    // Different input same output

    // "AAAA", "BBBB" ===> "AAA" , "ABBBB"
    //  same output for different input ;;; for encodePacked()

    // encode
    function encode(address _address, uint amount, string calldata name) 
        public 
        pure 
        returns(bytes memory) {
        return abi.encode(_address, amount, name);
    }

    // encode
    function encodePacked(address _address, uint amount, string calldata name) 
        public 
        pure 
        returns(bytes memory) {
        return abi.encodePacked(_address, amount, name);
    } // No Padding
    // compressed

    
    function collosion(string calldata s1, string calldata s2) public pure returns(bytes32){
        return keccak256(abi.encodePacked(s1, s2)); // passing dynamic data types
    }

    // "Hammad", "Saeedi"
    // 0x451bc138ac06c229d694a378dbd1f707cb7ac79bf7bea7fa58bc1e7f105016ce

    // "HammadS", "aeedi"
    // 0x13dbc0dc8ad8a94d62ed82ba16bc04e9139c35c61ef8a7621d65768a2efe3e34

    // same hash for different inputs


    // Avoid collosion:
    // - Rearrange so, no dynamic data types are near to each other
    // - use encode instead of encodePacked
}
