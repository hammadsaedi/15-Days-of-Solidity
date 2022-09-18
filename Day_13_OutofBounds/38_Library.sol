// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;


// Library
// Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.
// A library is embedded into the contract if all library functions are internal.
// Otherwise the library must be deployed and then linked before the contract is deployed.

// https://www.youtube.com/watch?v=OH5mafV6jVE&ab_channel=SmartContractProgrammer

library Math {
    // These fucntion may arithmatic overflow

    function factorial(uint num) internal pure returns(uint) {
        if (num == 1){
            return 1;
        }
        return num * factorial(num - 1);
    }

    function pow(uint num, uint power) internal pure returns(uint){
        return num ** power;
    }
}


contract Calculator {
    function factorial(uint num) public pure returns(uint) {
        return Math.factorial(num);
    }

    function pow(uint num, uint power) public pure returns(uint){
        return Math.pow(num, power);
    }
}
// So, library is like class in JAVA and methods are static? LOL. It's seems like that.abi


library Algorithm {
    // Array function to delete element at index and re-organize the array
    // so that their are no gaps between the elements.

    // Move the last element into the place to delete
    function remove(uint[] storage arr, uint index) public {
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract Array {
    using Algorithm for uint[];
    // It's like using name space for std?? Have no idea

    uint[] public array;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            array.push(i);
        }
        array.remove(1);

        assert(array.length == 2);
        assert(array[0] == 0);
        assert(array[1] == 2);
    }
}

// SafeMath is Library? Openzepplin's
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol