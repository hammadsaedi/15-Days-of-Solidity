// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Returns {
    // function can return multiple typed, multple values
    function defaultValue() 
        public
        pure
        returns (
            uint,
            int,
            bool,
            address
        ){
        return (uint(0), int(0), false, 0x0000000000000000000000000000000000000000);
    } // How to use? Wen called in function? Distruction. 
    // Is it like Python returning multiple value?
    // I think they are little bit different, Python creates list and return it. Solidity does not? Well I don't knoe both LOL


    // Return values can be assign to name
    // In this case return statement cab omitted
    // Then what they will return? Defualt value May be?
    function defaultValueV2() 
        public
        pure
        returns (
            uint x,
            int y,
            bool flag,
            address _address
        ){
    } // returns deflault values ;)

    // distruction of returned values
    function defaultValueV3() 
        public 
        pure
        returns (
            uint,
            int,
            bool,
            address
        ) {
        (uint x, int y, bool flag, address _address) = defaultValue(); // distruction of values returned by defaultValue() 
        return (x, y, flag, _address);
    } // works like other 

    // retuning non-primitive? or dynamic size or something else?
    function getString() public pure returns(string memory n){} 
    // returns ""

    function getArray() public pure returns(uint[1] memory nums){
       // nums.push(1); // Member "push" is not available in uint256[] memory outside of storage.
        nums[0] = 1;
    } // returns array with "1" element

    // can not input or output map; not iteratable?
    // function getMap(mapping (uint => address) memory) public 
    // {
        // at public:
        // Types containing (nested) mappings can only be parameters or return variables of internal or library functions.
        // at internal:
        // Type mapping(uint256 => address) is only valid in storage because it contains a (nested) mapping.

    // }
}