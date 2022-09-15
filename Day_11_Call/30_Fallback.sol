// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Fallback
 * Fallback is a function that does not take any arguments and does not return anything.
 * 
 * It is executed either when:
 *      a function that does not exist is called or
 *      Ether is sent directly to a contract but receive() does not exist or msg.data is not empty
 * fallback has a 2300 gas limit when called by transfer or send.
 */


// https://www.youtube.com/watch?v=CMVC6Tp9gq4&ab_channel=SmartContractProgrammer
// When function does not exist
// Direct Sendig ETH

// receive() when msg.data is empty
contract Fallback {
    // Warning 
    // This contract has a payable fallback function, but no receive ether function. 
    // Consider adding a receive ether function.


    event Log(uint gas);
    event Log(string func, address sender, uint value, bytes data);

    // Fallback functions must be declared as external
    fallback() external payable { // Not function keyword
        // send / trasnfer send 2300 gas to this function
        // call transfer all of gas to this function
        emit Log(gasleft()); // emit Event to check how many gas left after that
        // I can also do this to check about gas I was trying previoulsy
        emit Log("Fall Back", msg.sender, msg.value, msg.data);
    }

    receive() external payable { // When msg.data is empyty. It will be executed
        emit Log("Receive", msg.sender, msg.value, ""); // "msg.data" cannot be used inside of "receive" function.
    }

    // These functions are not accesible to call on remix gui direclty
    // But Low Level Itractions will help out
    // Call Data == msg.data
    
    // Helper Fucntion
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}
// When receive and When Fall Back will be Called?
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


contract Sender {
    // Sending via transfer
    function tranfer(address payable _to) public payable {
        _to.transfer(msg.value); // Value set during msg sending will be sent
    } // 2254 gas

    // sending via call
    function call(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send");
    } // 6115 gas
}