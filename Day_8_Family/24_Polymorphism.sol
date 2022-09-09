// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Mothod Over-Loading
// Same Name, Different No of prams or type of prams
contract Additions {
    
    function add(uint x, uint y) public pure returns (uint){
        return x + y;
    }

    function add(int x, int y) public pure returns (int){
        return x + y;
    }

    function add(uint x, int y) public pure returns (uint){
        return x + uint(y); // Not safer option 
        // Can over flow or Under Flow
    }

    // function add(uint x, int y) public pure returns (int){ // Function with same name and parameter types defined twice.
    //     return int(x) + y; // Not safer option 
    //     // Can over flow or Under Flow
    // }

    // Return Type does not matter in Method Over Loading

    // contructor over riding is not allowed here
}

// Method Over-Riding
// Over Riding functionality of funtion in child class
// Function that is going to be overridden by a child contract must be declared as virtual.
// Function that is going to override a parent function must use the keyword override.

contract A {
    function add(uint x, uint y) public pure returns (uint){ // cannot be over riden by child
        return x + y;
    }

    function add(int x, int y) public pure virtual returns (int){ // can be over riden by child
        return x + y;
    }

    function add(uint x, int y) public pure virtual returns (uint){ // can be over riden by child
        return x + uint(y); // Not safer option 
        // Can over flow or Under Flow
    }
}

// Same rule for inheritance as described in previous file ;)

contract B is A  {
    // All Function of A are accessable but only last two can ber over riden
    
    // have to add virtual; As D is over riding it. 
    // If we don't add virtual; it cannot be overriden
    // C is not over riding but it is virtual and its fine. ;) Not Lazmi
    function add(int x, int y) public pure virtual override returns (int){ // Overriding function is missing "override" specifier.
        return x + y + 1; // Buggy Code? LOOOL
    } // cannot be overriden by it's child as it's not virtual

    function add(uint x, int y) public pure virtual override returns (uint){ // can be over riden by child
        return x + uint(y) + 1; // Not safer option 
        // Can over flow or Under Flow
    }
}

// Muli Level Inheritance
contract C is B { 
    function add(uint x, int y) public pure override returns (uint){ // can be over riden by child
        return x + uint(y) + 2; // Not safer option 
        // Can over flow or Under Flow
    }
} // Has three function
// Breath First
// Check C, if it has function or not, Then B, then C;


// Overriding in Multiple Inheritance
contract D is A, B { // Derived contract must override function "add". Two or more base classes define function with same name and parameter types.
// both contract have same function
// So, we have to override them in child

    function add(int x, int y) public pure override(A, B) returns (int){ // Need to tell whose function is being over riden
        return x + y + 1; // Buggy Code? LOOOL
    } // cannot be overriden by it's child as it's not virtual

    function add(uint x, int y) public pure override(A, B) returns (uint){ 
        return x + uint(y) + 1; // Not safer option 
    // Can over flow or Under Flow
    }
} // 3 function are there. One inhernted by A


// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.

// Derived contract must override function "add". 
// Two or more base classes define function with same name and parameter types.
