// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Primitives {
    // Documentations; O Yeah!
    /// @title A title that should describe the contract/interface
    /// @author The name of the author
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details

    /**
     * boolean
     * uint
     * int
     * address
    */


    bool public flag; 
    // Intailly false? No Need to declear.
    // flag = true; // cannt change state variable outside method body. Just Like Java feilds.
    bool public flag2 = true; // Assinged on Declaration


    /**
     * uint stands for unsigned integer, meaning non negative integers
     * different sizes are available
     * uint8   ranges from 0 to 2 ** 8 - 1
     * uint16  ranges from 0 to 2 ** 16 - 1
     * ...
     * uint256 ranges from 0 to 2 ** 256 - 1
    */
   // Negative Numbers are not allowed. throw error. 
    uint256 public thisIs256 = 1;
    uint public also256 = 1; // uint is an alias for uint256
    // uint public 1js = 2; // throws error bcz of name. Same as JAVA ;)

    /**
     * Negative numbers are allowed for int types.
     * Like uint, different ranges are available from int8 to int256
     * int256 ranges from -2 ** 255 to 2 ** 255 - 1
     * int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
    int public thisIsInt = -89;
    int8 public thisIsInt8 = 7;

    /**
     * Min and Max Value of Integer?
     * Like:    Integer.MIN_VALUE; n Integr.MAX_VALUE; of JAVA
    */
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // Now, again JAVA time. LOL; Parsable? hihi ;)
    int public int8ToInt = type(int8).min;
    // int8 public intToInt8 = type(int).min; 
    // LOL; Error;
    // Type int256 is not implicitly convertible to expected type int8.


    // Max n Min for Unsigned int? It's
    uint public maxUint = type(uint).max;
    uint public minUint = type(uint).min;

    /**
     * Address:
     * What's Defualt Value: Burn Wallet. Dead Wallet. etc. means Null Wallet.
     * Here;
     * Everything comes out from non-existance towards some sort of exsistence, travel around the world, and go back to non-exsitence from exsitence when time or space comes.
     * Existence == My Wallet n Your Wallet
     * Non-Existence == Burn Wallet
     * LOL. 
     * 
     * 
    */
    address public defaultAddress;
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; 
    // address public addr2 = 0xBA35b7d915458EF540aDe6068dFe2F44E8fa733c; 
    // This looks like an address but has an invalid checksum. Correct checksummed address: "0xba35B7d915458Ef540ade6068DfE2f44E8fa733C". If this is not used as an address, please prepend '00'. For more information please see https://docs.soliditylang.org/en/develop/types.html#address-literals

    /**
     *
     * In Solidity, the data type byte represent a sequence of bytes. 
     * Solidity presents two type of bytes types :
     * - fixed-sized byte arrays
     * - dynamically-sized byte arrays.
     * The term bytes in Solidity represents a dynamic array of bytes. 
     * It’s a shorthand for byte[] .
    */
    bytes1 a = 0xb5; 
    // bytes a = 0xb5; // Type int_const 181 is not implicitly convertible to expected type bytes storage ref.
    //
    /// @dev Need More Info.


    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000

}