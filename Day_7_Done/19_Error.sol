// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// An error will undo all changes made to the state during a transaction.
// You can throw an error by calling require, revert or assert.
//          require is used to validate inputs and conditions before execution.
//          revert is similar to require. See the code below for details.
//          assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.
// Use custom error to save gas.

contract Error {

    uint public balance;
    
    // Requare
    // Require should be used to validate conditions such as:
    //      - inputs
    //      - conditions before execution
    //      - return values from calls to other functions
    function withdraw(uint amount) public {
        require(balance >= amount); // if requested amout is more than balance transaction will be reverted
        balance -= amount;
    }

    // revert: Used to throw error
    // Enclosed in if; 
    // same as revert ...
    // have same effect as V1 withdraw has
    function withdrawV2(uint amount) public {
        if (balance < amount){
            revert("Amount must be less than or equal to balance.");
        }
        balance -= amount;
    }

    // assert
    function withdrawV3(uint amount) public {
        assert(balance >= amount);
        balance -= amount;
    }


    uint public num;
    function testNum() public view {
        assert(num == 0);
    } 
    // Assert should only be used to test for internal errors,
    // and to check invariants.
    // Here we assert that num is always equal to 0
    // since it is impossible to update the value of num

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);
    // used to throw by using revert

    function withdrawV5(uint amount) public {
        if (balance < amount){
            revert InsufficientBalance(balance, amount);
        }
        balance -= amount;
    }
}


// another example
contract Account {
    uint public balance;

    // While depositing we need to make sure there is no arithmetic overflow 
    // Integer.MAX_VALUE + 1 == INTEGER.MIN_VALUE
    function deposit(uint amount) public {
        uint previousBalance = balance;
        uint newBalance = balance + amount; // adding amout in previous balance
        require(newBalance >= balance); 
        
        // there is no arithmatic overflow
        
        balance = newBalance; // updating new balance

        // rechecking over flow after updating at state level
        assert(balance >= previousBalance);
    }

    function withdraw(uint amount) public {
        uint previousBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= amount, "Under FLow");
        // if user request money more than it was present? Deal with it

        if (balance < amount){
            revert("Under FLow"); // same as require
        }

        balance -= amount; // withdrawal

        assert(balance < previousBalance); // Check if it's withdrwan or not
    }
}