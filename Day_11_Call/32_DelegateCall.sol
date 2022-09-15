// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Preserves contex

// Delegatecall executes other contract's code inside the contract that called it.
// delegatecall is a low level function similar to call.
// When contract A executes delegatecall to contract B, B's code is executed
// with contract A's storage, msg.sender and msg.value.

/*
A calls B, send 100 wei
            B calls C, send 50 wei
A ----> B -----> C
                msg.sender = B
                msg.value = 50
                execute code on C's state variables
                use ETH in C

A calls B, sends 100 wei
            B delegatecall C
A ----> B ----> C
                msg.sender = A
                msg.value = 100
                execute code on B's state variable
                use ETH in B
*/

// all the state variable must be same and same order
// else it will work weirdly bcuz: state var maps to storage of contract and here it will be altered 

// updates logic of contract

contract DelegateCaller {
    uint public num;
    address public sender;
    uint public value;

    function setState(address _address, uint _num) public payable {
        (bool success, ) =   _address.delegatecall(
            // abi.encodeWithSignature(
            //     "setState(uint256)",
            //     _num
            // )

            // same effect as above
            abi.encodeWithSelector(Target.setState.selector, _num)
        );

        require(success, "Failed to execute.");
    }
}


// state variable of Target will not be updated
// instead Caller state var will be updated

contract Target {
    uint public num;
    address public sender;
    uint public value;

    function setState(uint _num) public payable { // Delegate Call this function via DelegateCaller contract
        num = _num;
        sender = msg.sender;
        value = msg.value;
    } // state variable of DelegateCaller will be updated
    // Target State Variable will be remian same
}


// By using Delegate Call we can change functionality of function
// Change functionality of setState and deploy it;
// Change will be reflected in state var of caller
// So, smart contract is upgradable? LOL. May be that's another concepts