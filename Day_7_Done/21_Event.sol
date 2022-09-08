// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Events allow logging to the Ethereum blockchain. Some use cases for events are:
 *      Listening for events and updating user interface
 *      A cheap form of storage
*/
// they are cheap alternative of state varibles
// these data are writen once and cannot be retrieve by smart contract later.
// Purpose: Log when something happen, 
// What's use if it cannot be retrive by smart contracts? 
// Web3 Librarys can listens to events, can retrive them, do cool shit along with other tools

// https://www.youtube.com/watch?v=nopo9KwwRg4&ab_channel=SmartContractProgrammer

// https://www.youtube.com/watch?v=jaMHPT-78HM&ab_channel=EatTheBlocks
// can push data from smart contract to outside cosumers front ends etc
// In DEX:
// emit event whenever there is trade
// So, front end can do it own stuff, notify, charting etc...

// One way communication, Outside of blockchain

contract Events {
    // Event declaration or Defination
    event Log (
        string message, 
        uint val
    );
    // structured data, can use any type of data

    function logEvent(string calldata _message, uint _val) external { // Not an readonly function
        emit Log(_message, _val);
    } // transactional function not pure or view

    // if we want ot search for a particular event by the parameters that were logged then we use keyword indexed
    event IndexedLog (
        address indexed sender, 
        uint val
    );
    // indexing is expensive

    function IndexedLogEvent(uint _val) external {
        emit IndexedLog(msg.sender, _val);
    }
    // can filter out by indexed prams
    // up to three prams can be indexed
}

contract Chat {
    event Message (address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) public {
        emit Message(msg.sender, _to, message);
    }

    // Message is accesible to everyone who has access to blockchain
    // We have proof that message has sent from this to that wallet

    // How can we see message
    // can not be retrive by smart contract
    // web3 librarys do this cool filteration
    // As _to, and _from is indexed who can retrieve inbox of any address and send box as well. How cool?
}