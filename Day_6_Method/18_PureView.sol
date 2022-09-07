// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Already played wiyh you baby
// Once more
/**
 * کہیں شرمندہ نہ ہو رسم وفا میرے بعد
 * میرے ماضی کو نہ دو میری سزا میرے بعد
 * 
*/

/**
 * Getter functions can be declared view or pure.
 * View function declares that no state will be changed.
 * Pure function declares that no state variable will be changed or read
*/

// Gase Less? Yes, Transaction need gas. There is no transaction; No Chnage in state level

contract PureView {
    address private owner;

    // Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
    constructor() {
        owner = msg.sender;
    }

    // view
    // promise to read only state var and not to modify it
    function getOwner() public view returns (address) {
        return owner;
    }

    // pure
    // promise to never read or modify state var
    function add(int x, int y) public pure returns(int){
        return x + y;
    }
}