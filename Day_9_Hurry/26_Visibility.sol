// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Visibility
/** 
 * Functions and state variables have to declare whether they are accessible by other contracts.
 * 
 * Functions can be declared as
 * public: 
 *          - any contract and account can call
 * private:  
 *          - only inside the contract that defines the function
 * internal:
 *          - only inside contract that inherits an internal function
 * external:
 *          - only other contracts and accounts can call
 * 
 * State variables can be declared as public, private, or internal but not external.
*/

// or encapsulation in oop

contract Base {
    
    // Functions cannot be set without visibilty
    // But, State Variable can be
    

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function hyPublic() public pure returns(uint){
        return 0;
    }


    // private function
    // only inside the contract that defines the function can call
    function privacy() private pure returns(uint) {
        return type(uint).max;        
    }
    // "virtual" and "private" cannot be used together.
    // As private function cannot be called by child contract or other so, it cannot be overriden as well
    // can we call it by super?


    // to make private accessible 
    // make public function that call private function of same contract
    function disturbPrivacy() public pure returns(uint) {
        return privacy(); // calls private function of same contract and return it back to public
    }


    // Internal Functions
    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    function digest() internal pure returns(uint){
        return 0;
    } // It will not be avaible for invoking in Remix or Web3 Libs


    // To invoke internal function we have to access it via public function
    function callDigester() public pure returns(uint) {
        return digest();
    }


    // External functions can only be called
    // - by other contracts and accounts
    function callBase() external pure returns(uint) {
        return 1;
    }

    // // Can we call it in public func within same contract. Obvs Not. Why not try it?
    // function DoCallBase() public pure returns(uint){
    //     return callBase(); // Undeclared identifier. "callBase" is not (or not yet) visible at this point.
    // } // This function will not compile since we're trying to call an external function here.


    // State Varibale
    int def; // Default; It's private??? don't know. Works like Internal
    int public defV2; // Accesible Everywhere
    int private defV3; // In contract and childs
    int internal defV4;
    // int external defV5; // Expected identifier but got 'external'
    // // State variables cannot be external so this code won't compile.
}

// Public Function also can be called via Web3 Libs, Remix, or any node op. 
// By any other contract using interface :), 
// By it self and childs

contract Child is Base {
    // All Funtion which are public, internal are accessible

    // to invoke private function
    // we have set invoker function which is public so, it can call private functions

    // // Can we call private function in childs by super?
    // function overTakePrivacy() public pure returns(uint){ 
    //     return super.privacy();
    // } // Member "privacy" not found or not visible after argument-dependent lookup in type(contract super Child)
    // Cannot do this shit


    // Testing internals
    function myDigestion() public pure returns(uint){
        return digest(); // Base Internal Function
    } // Works fine

    // Getter for Base Sate Var
    function getDef() public view returns(int){
        return def;
    } // Works Like Internal; No Modifier was given

    function getDefV2() public view returns(int){
        return defV2;
    } // Works fine
    // getting parents public var

    // function getDefV3() public view returns(int){
    //     return defV3;// Undeclared identifier. Did you mean "def", "defV2" or "defV4"?
    // }
    // Does not work; as its private

    function getDefV4() public view returns(int){
        return defV4;
    } // Works Fine
    // Accessing internal var

}

// We can play amny games here. Not enough here. But, for now. See you agian.

// Private is not private ,)
// https://www.youtube.com/watch?v=Gg6nt3YW74o&ab_channel=SmartContractProgrammer

// private var can be read ouy side blockchain by using ether.js 
// They are private only on contract level
// https://www.youtube.com/watch?v=C9C4zgskHwg&ab_channel=EatTheBlocks