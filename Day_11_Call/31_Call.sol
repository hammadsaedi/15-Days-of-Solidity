// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Call
 * call is a ""low level function""" to interact with other contracts.
 * 
 * This is the recommended method to use when you're just sending Ether via calling the fallback function.
 * However it is not the recommend way to call existing functions.
*/

// https://www.youtube.com/watch?v=xIAs2S9aCKo&ab_channel=SmartContractProgrammer
// ABI to intrect with fucntions of other contract

// Call is also called to send ETH
// Works alog with Receive and Fall Back

contract Call {
    bytes public data;

    function callFoo(address _address) public  payable { 
        // Unused local variable.
        (bool success, bytes memory _data) = _address.call {
            value: msg.value, // specify value of eth to be sending
            gas: 5000 // specifying Sending of gas while calling this function
        }( // It returns two values 1- If fucntion was successfully executed / 2- More bytes of data returned
            abi.encodeWithSignature(
                // without 256 fallback will be called there :(
                "foo(string,uint256)",     // signatureString == Function Signature  // No space allowed
                "Calling Foo", 19    // arg == Passed Params
            )
        );
        require(success, "Failed to Execute");
        data = _data;
    } 

    // When we call fucntion which does not exist Fallback will be executes
    // bar does not exist in Target Contract
    function callBar(address _address) public  payable { 
        // Unused local variable.
        (bool success, bytes memory _data) = _address.call {
            value: msg.value, // specify value of eth to be sending
            gas: 5000 // specifying Sending of gas while calling this function
        }( // It returns two values 1- If fucntion was successfully executed / 2- More bytes of data returned
            abi.encodeWithSignature(
                "bar(string,uint256)",     // signatureString == Function Signature  // No space allowed
                "Calling Foo", 19    // arg == Passed Params
            )
        );
        require(success, "Failed to Execute");
        data = _data;
    } 
}

contract Subject {
    event Log(string data, uint value); // Event to trig when func will be called

    function foo(string memory data, uint value) public payable { // Target Function to be called by another contract via Call
        emit Log(data, value);
    }

    fallback() external payable {
        emit Log("Fallback was called", 0);
    } 

    receive() external payable {}
}
