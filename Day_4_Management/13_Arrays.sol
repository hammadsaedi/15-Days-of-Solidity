// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/* Arrays have:
    - compile time fixed size
    - dynamic size
*/
contract Arrays {
    // Arrays initilization 
    
    // int[] nums = new int[10]; // Not Valid
    
    int[] public nums; // initalized. LOL. Size?
    // dynamic size;

    // Fixed Size Arrays 
    int[10] public fixedNum; 


    // get ith element
    function getIthNums(uint i) public view returns (int) {
        return nums[i];
        // Num has dynamic size. What if, I try to acces i which has not added yet?
        // call to Arrays.getIthNums errored: VM error: revert.
    } // ith should be added before access. O God. Thanks. ;)

    // for fixed size num. It works like JAVA. it has default value for elements. 
    function getfixedNums(uint i) public view returns (int) {
        return fixedNum[i];
    }

    // can we change value of array?
    function set(uint i, int value) public {
        fixedNum[i] = value; 
        // fixedNum.pop(); // Member "pop" not found or not visible after argument-dependent lookup in uint256[10] storage ref.
    } // Yes, it is
    
    // ArraysIndexOutOfBoundException same ;)

    /**
     * push(); like append() -- add at last
     * pop(); remove last element
    */

    uint[] Unsigned;
    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        // nums.push(i); 
        // Not wrking         
        // Its my mistake. I'm passing. unit in int array.
        // nums.push(); // wroking? Whot?
        // Member "push" not found or not visible after argument-dependent lookup in int256[] storage ref.
        // Fuck works only for Unsigned Int? Not Int. Okay.
        Unsigned.push(i);
        Unsigned.push();
        // will you add? 0? Okay. // Yes, It's adding 0. Means incraesing length;
    }

    // Same for pop
    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        Unsigned.pop();
        nums.pop(); // Works? 
    }

    function getLast() public view returns (uint){
        return Unsigned[Unsigned.length - 1];
    }

    // fucntion can return array as well
    function getfixedNums() view public returns (int[10] memory){ // Data location must be "memory" or "calldata" for return parameter in function, but none was given.
        return fixedNum;
        // Return argument type int256[10] storage ref is not implicitly convertible to expected type (type of first return variable) int256[] memory.
        // Fuck have to tell size in defination. :(
    }


    // deletes arrays element. Means it sets value to default. Work for all.
    function remove(uint index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete nums[index];
    }

    // memory level arrays. Local Arrays
    function counting(uint n) pure public returns (uint[] memory){
        // create array in memory, only fixed size can be created
        // uint[] memory a = new uint[5]; 
        // Type function (uint256) pure returns (uint256[5] memory) is not implicitly convertible to expected type uint256[] memory.
        uint[] memory a = new uint[](n);
        for (uint i = 0; i < a.length; i++) {
            a[i] += i;
        }
        return a;
    }
}

// Pop and Push does not work for Fixed Size Array
// Length Work for all

// Push: Push is used when a new element is to be added in a dynamic array. 
// The new element is always added at the last position of the array.

//  Pop: Pop is used when the last element of the array is to be removed in any dynamic array.

//  Length of Array: Length of the array is used to check the number of elements present in an array. 
//The size of the memory array is fixed when they are declared, while in case the dynamic array is defined at runtime so for manipulation length is required.




// Array Elements Replacement from the end
contract  ArrayReplaceFromEnd {
    uint[] public nums;

    // Fucntion will remove elemnt at index ith and trim the size
    function remove(uint i) public {
        // Idea: Move the last element into the place to delete
        nums[i] = nums[nums.length - 1];
        
        // Now remove last elment to trim the size
        nums.pop();
    } 
    
    // But it will change the order.
    // If, Order has to be preserved and size has to be trimed?

    function removeV2(uint i) public {
        // Idea: Move the last element into the place to delete
        for (; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }        
        // Now remove last elment to trim the size
        nums.pop();
    }

    function push(uint i) public {
        nums.push(i);
    }
}