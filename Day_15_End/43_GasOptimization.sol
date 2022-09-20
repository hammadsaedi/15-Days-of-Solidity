// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Some gas saving techniques.
 * 
 * Replacing memory with calldata
 * Loading state variable to memory
 * Replace for loop i++ with ++i
 * Caching array elements
 * Short circuit
*/

// https://www.youtube.com/watch?v=PYilP2bjtwc&ab_channel=EatTheBlocks
// 1- Minimize On Chain Data
// 2- Use Libararies [Deployed]
// 3- Use ERC1167 {Deploy same logic?}
// 4- Turn on Solidity comipler (Compilationm || Deployement)
// 5- Use Event
// 6- Use Literal Value instead of computed value
// 7- Avoid to copy arrays in memory [creat storage pointer if you want to edit]
// 8- Avoid for loop on dynamic arrays
// 9- Optimize order of state varibale declared [EVM ;;; Beaware of slots]
// 10- Use ETH-GAS-REPORTER npm

// https://www.youtube.com/watch?v=4r20M9Fr8lY&ab_channel=SmartContractProgrammer

// Moralis
// https://www.youtube.com/watch?v=IkdoQI7API0&t=10s&ab_channel=MoralisWeb3
// In solidity 0.8; There is checked arithmetic (Overflow) which is costly
// Use unchecked arithmatic to save gas

contract Gas {
    // start - 50908 gas
    // use calldata - 49163 gas
    // load state variables to memory - 48952 gas
    // short circuit - 48634 gas
    // loop increments - 48244 gas
    // cache array length - 48209 gas
    // load array elements to memory - 48047 gas
    // uncheck i overflow/underflow - 47309 gas   

    uint public total;


    // start - not gas optimized
    function sumIfEvenAndLessThan99(uint[] memory nums) external {
        for (uint i = 0; i < nums.length; i += 1) {
            bool isEven = nums[i] % 2 == 0;
            bool isLessThan99 = nums[i] < 99;
            if (isEven && isLessThan99) {
                total += nums[i];
            }
        }
    }

    // gas optimized
    // [1, 2, 3, 4, 5, 100]
    function sumIfEvenAndLessThan99V2(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;

        for (uint i = 0; i < len; ) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
            unchecked {
                ++i;
            }
        }
        total = _total;
    }
}