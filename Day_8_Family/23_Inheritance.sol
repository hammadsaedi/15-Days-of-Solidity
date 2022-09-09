// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Animal {
    uint public DOB;
    string public name;
    string public color;
    
    constructor(string memory _name, string memory _color){
        DOB = block.timestamp;
        color = _color;
        name = _name;
    }

    function getColor() public view returns (string memory){
        return color;   
    }

    function getName() public view returns (string memory){
        return name;   
    }
}



// Error: if contrctor is not declared: Contract "Cat" should be marked as abstract.
// We have to call parent contructor if it's prams are changed.

// Parent cosntructor is always called.

contract Cat is Animal {  // is -> Inherent ::: Cat inherent Animal
    constructor(string memory _name, string memory _color) Animal(_name, _color) {
        // can be empty
    }
}

contract Dog is Animal {
    bool public isBark;

    // passing argument is parent contructor, so it can be inilized there
    // Name_of_Parent(arguments)
    constructor(string memory _name, string memory _color, bool _isBark) Animal(_name, _color) {
        isBark = _isBark;
    }

    function myDog() public view returns (string memory) {
        // return name + " " + color;
        // string concatinations?

        return string(abi.encodePacked(color, " ",  name, " ", isBark?"barks":"does not bark."));
    }
    // All functions and stuffs of Parent are accesible in Inhernted Contract


    // can change inherented properties as well
    // is there anything static. No, I think.
    function changeColor(string calldata _color) public {
        color = _color;
    }
    // Unlike functions, state variables cannot be overridden by re-declaring it in the child contract. ;;; 0.8
    // In new versions we can do this epic shit

}


// Another way to instantiate parent by constructor
contract Billi is Cat("Billi", "Back") {
    // All Methods of Cat are accesible in this contract
}


// Multiple Inheritance
// One contract can be inherented from more than one contarct as well
// So, what happens if, Both parents have same property?

// contract Parent1 {
//     string public color;
//     // other characteristics

//     // can there be some properties which cannot be inherented?

//     constructor(string memory _color){
//         color = _color;
//     }
// }

// contract Parent2 {
//     string public color; // Identifier already declared.
//     // other characteristics

//     constructor(string memory _color){
//         color = _color;
//     }
// }

/*
Derived contract must override function "color". 
Two or more base classes define function with same name and parameter types. 
Since one of the bases defines a public state variable which cannot be overridden,
 you have to change the inheritance layout or the names of the functions.

*/
// contract Son is Parent1, Parent2 { 
//     uint public DOB;
//     constructor(string memory _color) Parent1("Brown") Parent2("White"){
//         DOB = block.timestamp;
//     }
// }



// https://www.youtube.com/watch?v=ITxPOG9Djwc&ab_channel=SmartContractProgrammer

// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.

contract Father {
    uint public father;

    constructor() {
        father = block.timestamp;
    }
}

contract Mother {
    uint public mother;

    constructor() {
        mother = block.timestamp;
    }
}

contract Son is Father, Mother { // LOL
    uint public son;

    constructor() {
        son = block.timestamp;
    }
} // Time will be same; LOL. Trasaction is mined at same time
// Try anything else to check order of execution. May be incrementor Logics? May be next time. ;)






// Order of Inheritence
// most base to most derived

/*
  X
 /|
Y |
 \|
  Z

Z inhert Y and X
Y inhert X
X does not any

Order: 
Most Base to Derived:
X, Y, Z


------ 2 ----

  X 
 /  \
Y    A
|    |
|    B
\    /
  Z   
  
Order: 
X, Y, A, B, Z
X, A, Y, B, Z

Breath Last?
We have to breadth-first search
*/

contract X {

}

contract Y is X {

}

contract Z is X, Y { // Most Base to Derived
    constructor() X() Y() { // contructor order will be same as Most Base to Derived

    }
} // If we switch the order, it will throw errors

// In Java, there is no multiple inheritance
// But Multi- Level Inheritence
// Solidity allow multiple inheritance and here we have to sort them Most Base to Derived one; 
// So, Solidity can breath-fast search while looking for over riden methods.