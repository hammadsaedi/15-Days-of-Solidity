// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13; // compiler version must be greater than or equal to 0.8.13 and less than 0.9.0

contract HelloWorld {
    // public string greet = "Hello World."; 
    // Wrong
    /**
     * string   -- Data Type
     * public   -- Access modifire
     * greet    -- Variable Name
     * 
    */
    string private greet = "Hello World."; // state variable
    // Run on Remix:
    // Getter and State Variable have same effect after deployment. Let's make it private
    // After Making private; It's no longer shown after deployment. 

    /**
     * Visibilty Modifire is Mendatory?: 
     * No visibility specified. Did you intend to add "public"?
     * 
     * For Parameters:
     * Data location must be "memory" or "calldata" for parameter in function, but none was given.
     * 
     * this. in Solidity?
     * Expression has to be an lvalue.
    */
    function setGreet(string memory _greet) public { // setter
        greet = _greet;
    }

    /**
     * returns (string): ?
     * Data location must be "memory" or "calldata" for return parameter in function, but none was given.
     * 
     * If method is not supposed to do any change in state.
     * Function state mutability can be restricted to view
     */
    function getGreet() public view returns (string memory) { // getter
        return greet;
    }
}
