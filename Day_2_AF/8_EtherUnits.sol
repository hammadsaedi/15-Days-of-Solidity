// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Transactions are paid with ether.
 * Similar to how one dollar is equal to 100 cent, one ether is equal to 10**18 wei.
 */
contract EtherUnits {
    // 1 wei is equal to 1
    uint public oneWei = 1 wei;
    bool public isOneWei = oneWei == 1; // == bool Operator. ;)

    // 1 Ether is equal to 10**18 
    uint public oneEther = 1 ether;
    bool public isOneEther = oneEther == 10**18; // 10**18 == 10e18


    // ETH has 18 Decimals; S solidity does not support floating point number. 
    // 10^18 wei makes one ETH
    // Just Like BTC and Satoshi Concept.

    // What about Gwei?
    // 1 wei == 1
    // gwei == 1e9
    // 1 ether == 1e18
}