// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Functions and addresses declared payable can receive ether into the contract. 
// https://www.youtube.com/watch?v=A4VMhRIWSs0&ab_channel=SmartContractProgrammer

contract Payable {
    // Payable address can receive Ether
    address payable public owner; // can send from this contract to owner address. How cool its?
    // address public payable owner; // Expected identifier but got 'payable'

    // payable contructor can receive ether
    constructor() payable {
        // owner = msg.sender; // Type address is not implicitly convertible to expected type address payable.
        owner = payable(msg.sender); // Coverting into payable ;; casting
    }

    // owner modifier
    modifier isOwner {
        require(owner == msg.sender, "Not a contract owner.");
        _;
    }

    // getter to get balance of this contract 
    function getBalance() view public returns(uint) {
        return address(this).balance;
        // this === this contract (object)
        // address will cast it and return contract address
        // address have feild balance global variable
        // I think as it. Not sure about these. LOL
    }

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable {}

    // Function is not payable; So, We cannot send ether to it
    function depositV2() public {}

    // function to withdraw ether from this contract to owner
    function withdraw() public isOwner {
        // get total balance and pass it to requesting call

        // Here we'll withdraw total amount
        // We can also take amount as prams and check if requested prams is less than or equal to amout present and execute function
        // As we did it in previously

        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        (bool success, ) = owner.call{value: getBalance()}(""); // More details in next file. :)
        // function or what ever it is, returning more than once value and we are distruction it here

        // checking is trasaction succesful or not?
        require(success, "Failed to Send Ether");
    }


    // We can also withdraw Ethers to any other wallet 
    // But in prams we'll make it payable to able to recieve Ethers
    function withdraw(address _to, uint _amount) public isOwner {
        require(_amount <= getBalance(), "Requested amount is more than present balance");
        
        // as _to is payble, can recieve ETH
        (bool success, ) = _to.call{value: _amount}("");
        
        // Check
        require(success, "Failed to send Ether");
    }
    
} // We can make wallet Using these Shit? // Have it's native currency. What ever I used to think can do now. Relax. We'll do this in Projects Sections

// How we'll send ether? setting value of ether and calling functions
// Can do in remix too. Explained in above video
// We'll try Web3 Lib to do this shit. LOL 