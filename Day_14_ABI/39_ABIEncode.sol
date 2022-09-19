// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

interface IERC20 {
    function transfer(address to, uint amount) external;
}
// Interface to interact with ERC20 contract address

// ABI, EVM, Byte Code nad much more
// https://coinsbench.com/solidity-tutorial-all-about-abi-46da8b517e7

/**
 * Byte Code
 * The EVM bytecode above is nothing more than a sequence of EVM opcodes written in hexadecimals
 * // It's like Java Byte Code. code once run everywhere. We have JVM there. And here EVM.
 * 
 * Contract is deployed. I mean byte code at global level. But how to interact with it?
 * 
 * ABI Code:
 * “The ABI is the standard way to interact with contracts in the Ethereum ecosystem. 
 * Both from outside the blockchain and for contract-to-contract interaction”.
 * The “I” in ABI stands for Interface.
 * 
 * In any EVM based chain, the ABI is basically how contracts calls are encoded for the EVM and vice versa.
 * 
 * JSON ABI of a contract:
 * Representation in arrays of object
 * // Public getter for public state var is created
 * 
 * ABI defines how Solidity data types should be 
 * encoded so that they can be passed to + interpreted by the EVM
 * 
 * 
 * abi.encode(…)
 * The solidity built-in function abi.encode enables 
 * to encode any Solidity types into raw bytes, 
 * that can be interpreted directly by the EVM.
 * 
 * 
 * Solidity ABI — encoding contract calls
 * The functions abi.encodeWithSignature(...) and abi.encodeWithSelector(...)
 * can be used in Solidity to prepare payloads in raw bytes for external contract calls.
 * Such payloads can then be passed as parameters to the low level 
 * Solidity .call(...) , .delegatecall(...) and .staticcall(...) functions.
*/

// https://medium.com/b2expand/abi-encoding-explanation-4f470927092d
// “Static types are encoded in-place and 
// dynamic types are encoded at a separately allocated location after the current block.”


contract Encode {
    function encodeWithSignature(address _to, uint amount) 
        public 
        pure
        returns(bytes memory){
            return abi.encodeWithSignature(
                "transfer(address,address)", 
                _to,
                amount
            );
        // On Run Time
        // Typo or Error will not checked on compile time
    }

    function encodeWithSelector(address _to, uint amount) 
        public
        pure 
        returns (bytes memory){
            return abi.encodeWithSelector(
                IERC20.transfer.selector,
                _to,
                amount
            );
        // Type is not checked - (IERC20.transfer.selector, true, amount)
    }

    function encodeCall(address _to, uint amount) 
        public
        pure
        returns (bytes memory) {
            return abi.encodeCall(IERC20.transfer, (_to, amount));
        // Typo and type errors will not compile
    }

    // All of them returns: 
    // Imput: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 124
    // 0xba45b0b80000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4000000000000000000000000000000000000000000000000000000000000007c
}

/**
 * The functions abi.encodeWithSignature(...) and abi.encodeWithSelector(...)
 * can be used in Solidity to prepare payloads in raw bytes for external contract calls. 
 * Such payloads can then be passed as parameters to the low level Solidity .call(...) ,
 * .delegatecall(...) and .staticcall(...) functions.
*/
