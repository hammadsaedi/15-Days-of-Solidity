// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Function Selector
 * When a function is called, the first 4 bytes of calldata specifies which function to call. This 4 bytes is called a function selector.
 * 
 * Take for example, this code below. It uses call to execute transfer on a contract at the address addr.
 * 
 * addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))
 * 
 * The first 4 bytes returned from abi.encodeWithSignature(....) is the function selector.
 * Perhaps you can save a tiny amount of gas if you precompute and inline the function selector in your code?
 * Here is how the function selector is computed.
 * 
 * bytes4(keccak256(bytes(_func)));
 * 
*/

// https://www.youtube.com/watch?v=Mn4e4w8h6n8&ab_channel=SmartContractProgrammer
contract Receiver {
    // Event to see what's msg.data while function was called
    event Log(bytes data);

    // I'll call this function adn later on check event log to see msg.data
    function transfer(address _to, uint amount) external {
        emit Log(msg.data);
    }
    /* "data": 
        "0xa9059cbb                 // First four bytes encode the function to call {Function Selector}
        // Rest of data is params of function
        0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4             // Address _to
        0000000000000000000000000000000000000000000000000000000000000001"          // uint _amount 
        // Encoded in HEX
    */

}


contract FunctionSelector  {
    // Function returns function selector in bytes of function signature which was passed 
    function getSelector(string calldata _function) external pure returns(bytes4) { // passing fucntion signature 
        return bytes4(keccak256(bytes(_function)));
    }
    // More on keccak256 in next times

    // call this function with params
    // "transfer(address, uint256)"
    // It'll return first 4 bytes emit by event Log
    
    // Returns: "bytes4: 0x9d61d234"
} // This is how data is encoded while calling a function

