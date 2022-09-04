// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Conditional {
    // can't use conditional outside method body like we do in python
    
    // O, for state variable? 
    // Conditioanl Operator?
    // ? : (Conditional )If Condition is true? Then value X : Otherwise value Y
    
    
    // int public flag = (1 ether == 10e18)? 1 : 0; 
    // Type uint8 is not implicitly convertible to expected type int256.

    // int public flag = (1 ether == 10e18)? -1 : 0; 
    // True expression's type int8 does not match false expression's type uint8.

    int public flag = (1 ether == 10e18)? -1 : -2; 
    // Works fine

    uint public flag2 = (1 ether == 10e18)? 1 : 0; 
    // Works fine

    // True expression and false expression both has to be pf same type: But, What about zero. Is it unit or int?
   
    // Lets try, type casting.
    int public flag3 = (1 ether == 10e18)? int(1) : int(0);  // Python symtax works.
    // Type uint8 is not implicitly convertible to expected type int256.

    // Nesting Coooool
    int public flag4 = (1 ether == 10e18)? int(0):((1 ether > 10e18)?int(1):int(-1));  

    // Canot use condtional as it in Python
    // Unclose in function
    // if
    /* Linter: Parse error: extraneous input 'if' 
        expecting {
            'from', 
            '}',  
            'error',  
            'using', 
            'struct', 
            'modifier', 
            'function', 
            'event', 
            'enum', 
            'address', 
            'mapping', 
            'calldata', 
            'revert', 
            'var', 
            'bool', 
            'string', 
            'byte', 
            'callback', 
            Int, 
            Uint, 
            Byte, 
            Fixed, 
            Ufixed, 
            'leave', 
            'payable', 
            'constructor', 
            'fallback', 
            'receive', 
            Identifier
        } [undefined]
    */
    // Function, variable, struct or modifier declaration expected.
    
    // Will cover these things in upcomming days. In Sha Allah!

    function max(int x, int y) pure public returns(int) {
        if (x > y) return x;
        else return y; 
        // if more line use { } same as JAVA
    }

    function maxV2(int x, int y) pure public returns(int) {
        return (x > y)?x:y; // same effect ;)
        // Notice, no Error?
        // x and y both are declared as int. 
        // Above, we were daeling with literals
        // JAVA also sucks at this. ;)
    }

    // Try overleading
    function max(int x, int y, int z) pure public returns (int){
        return max(x, max(y, z)); // Amazing?
    }

    // Nesting is also allowed
    function maxV3(int x , int y, int z) pure public returns (int) {
        if (x > y) {
            if (x > z) {
                return x;
            } else {
                return z;
            }
        } else {
            if (y > z) {
                return y;
            } else {
                return z;
            }
        }
    }

    // Logical Operators
    function maxV4(int x , int y, int z) pure public returns (int) {
        if (x > y && x > z) {
            return x;
        } else {
            if (y > x && y > z) {
                return y;
            } else {
                return z;
            }
        } 
    }

    // switch case alloed?
    // Not there :]


    // Will play with operators next time

}
// Notice, Only pure is used. Means on deployment fee will be charged. Rest we can enjoy. Haha.