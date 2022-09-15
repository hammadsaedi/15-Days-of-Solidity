// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * How to send Ether?
 * You can send Ether to other contracts by
 * transfer (2300 gas, throws error
 * send (2300 gas, returns bool
 * call (forward all gas or set gas, returns bool
 * 
 * 
 * How to receive Ether?
 * A contract receiving Ether must have at least one of the functions below
 * receive() external payabl
 * fallback() external payable
 * receive() is called if msg.data is empty, otherwise fallback() is called.
 * 
 * Which method should you use?
 * call in combination with re-entrancy guard is the recommended method to use after December 2019.
 * 
 * Guard against re-entrancy by
 * Mking all state changes before calling other contracts
 * using re-entrancy guard modifier
*/

// https://www.youtube.com/watch?v=mlPc3EW-nNA&ab_channel=SmartContractProgrammer
// https://www.youtube.com/watch?v=_Nvl-gz-tRs&ab_channel=EatTheBlocks

// Address Payable: Smart Contarct can send ETH to this address
// Function Payable: ETH can b send to this function

contract Sender {
    // to send ether contract should be able to recieve it

    // 1 Payable contructor
    constructor() payable {

    }

    // 2 Paybale Fucntions 
    receive() external payable {} // No Function keyword More details in next file as well

    // Three ways to send ETH from contract to any address
    function sendViaTransfer(address payable _to, uint _amount) public payable {
        require(_amount <= getBalance(), "Requested amount is more than present balance");
        // This function is no longer recommended for sending Ether.
        _to.transfer(_amount);
        // We can also pass msg.value as it is amount passed to be send
    }

    function sendViaSend(address payable _to, uint _amount) public payable {
        require(_amount <= getBalance(), "Requested amount is more than present balance");
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(_amount);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to, uint _amount) public payable {
        require(_amount <= getBalance(), "Requested amount is more than present balance");
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
    (bool sent, /*bytes memory data */) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}


contract Receiver {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
*/
// https://www.youtube.com/watch?v=CMVC6Tp9gq4&ab_channel=SmartContractProgrammer

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {} 
    // More on Fallback in next file. :)

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// Not got whole Idea
// Have ti work on mini project for that
// Got, Idea how it's working Not not clear about differences and gas scene
// Will Do it later. In Sha Allah 