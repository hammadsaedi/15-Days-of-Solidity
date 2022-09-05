// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Mapping {
    /**
     * Maps are created with the syntax mapping(keyType => valueType).
     * The keyType can be any built-in value type, bytes, string, or any contract.
     * valueType can be any type including another mapping or an array.
     * Mappings are not iterable.
    */

    // Mapping from address to uint
    mapping(address => uint) public balance; // It maps address with unsigned int. Save Record of Address Balance
    // It's like Pyhton Dic an Java Hash Maps?

    function getBalance(address _address) public view returns (uint) { // returns valueType of map
        return balance[_address];
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        // So, if balance of any wallet address is not saved. It will return 0; How cool?
    }

    function setBalance(address _address, uint amount) public {
        balance[_address] = amount; // returns balance; but we are picking it up
        // No need to use set keyword. Every thing is there by default. LOL. 
    }

    function updateBalance(address _address, uint amount) public {
        setBalance(_address, amount + balance[_address]); // Increment Balance
    } // What about decrement?

    function remove(address _address) public {
        delete balance[_address];
        // Reset the value to the default value.
        // What if; Address was no added before?
        // 
    }

    // What about decrement?
    function updateBalanceV2(address _address, int amount) public {
        setBalance(_address, uint(amount + int(balance[_address]))); 
    } // It's not safer option 
    // Why?
    // 1 - 2 === 115792089237316195423570985008687907853269984665640564039457584007913129639935
    // binary code of int(-1) is == to this number or something like this. 
    // But, this is not great idea to incement and decrement the balance
    // will learn more tricks later. ;)

    // Can we set balance of Null Wallet?
    // 0x000000000000000000000000000000000000dead
    // Yes, we can
}

// Nesting of Maping
// Let's make censorship LOL like Banks?
contract Bank {
    // Contract Owner. LOL?
    address public bank;
    
    // set user defined modifier ?
    modifier isBank {
        require(msg.sender == bank);
        _;
    } // more details next time.

    constructor(){ // On Deployment; constructor will be called and it set the bank
        bank = msg.sender;
    }

    // Nested maping
    mapping(address => mapping(bool => uint)) public balance;
    // Idea is same; but if nested mapping is set to false. Address can not be used
    // Here, I'm not going to make use case and block. Just false value will not be seen in balnce sheet.

    function setBalance(address _address, uint amount)  public isBank {
        balance[_address][true] = amount; 
    }   

    // View true Balance of address
    function getBalance(address _address) public view returns (uint){
        return balance[_address][true];
    }

    // blocks all amount of address only present, not future ;)
    function blockAmount(address _address) public isBank {
        balance[_address][false] += balance[_address][true]; // In case, there is already block amout. It will be added
        delete balance[_address][true]; 
    }

    // unblocks amout
    function unBlockAmount(address _address) public isBank {
        balance[_address][true] += balance[_address][false]; // In case there in unblocked amount. It will be added
        delete balance[_address][false]; 
    }

    // add amount in a address
    function deposit(address _address, uint amount) public {
        balance[_address][true] += amount;   
    }

    // withdraw amout from caller address
    function withdraw(uint amount) public returns (uint){ // return new balance
        require(balance[msg.sender][true] >= amount);   
        return (balance[msg.sender][true] -= amount);
    } 

    // Transfer amount from caller address to given address
    function transfer(address _address, uint amount) public {
        withdraw(amount); // msg.sender? who is? EVM or me? Sus?
        deposit(_address, amount);
    }
    // Is these secure. Remember DAO attacks? LOL!

    // Functionality for 2D / nD is same as 1D? Same.
}
// contract is working fine as it was supposed to be
// More about modifirs and require next time. 