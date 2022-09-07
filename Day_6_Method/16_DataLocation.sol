// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Data Locations - Storage, Memory and Calldata
 * 
 * Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
 *      storage - variable is a state variable (store on blockchain)    // state varibale
 *      memory - variable is in memory and it exists while a function is being called   // data is loaded on to memory
 *      calldata - special data location that contains function arguments   // like memory except can only be used as fucntion input
 *        
*/

// For dynamic data type: while input and output use memory / call data
// has potential to save gas fee

// https://docs.soliditylang.org/en/v0.8.16/introduction-to-smart-contracts.html?highlight=#storage-memory-and-the-stack
// https://www.youtube.com/watch?v=wOCIhzAuhgs&ab_channel=SmartContractProgrammer

contract DataLocations {

    // cant be public private etc
    // make sense, it type. 
    struct data {
        uint balance;
        string name;
    }

    // length of map
    uint public length;

    // Address - Indices
    mapping(uint => address) indices;
    
    // mapping(address => struct) database; 
    // Can't map directly, hav to tell which struct. 
    // bcuz each struct gonna different
    
    mapping(address => data) database;


    function add(address _address, uint _balance, string memory name) public {
        // creating data struct and adding in map
        database[_address] = data(_balance, name);
        // maping address to indices or something like that
        indices[length++] = _address; // incementing length

    }

    function updateBalance(address _address, uint _balance) public {
        // same way
        // But just passed previously saved name along with new balalnce to over write
        // Bit Costly? Rewriting something which is already there
        database[_address] = data(_balance, database[_address].name);
    }

    function updateBalancev2(address _address, uint _balance) public {
        // same way
        // but just updating balance
        database[_address].balance = _balance;
    }

    function updateV2(address _address, uint _balance) public {
        // creating data struct
        data memory buffer = database[_address]; //reading state var and assignming it to memoray
        // Buffer is read only; Change in buffer will on reflect on State Level
        // Mean it's just a local varaible
        buffer.balance = _balance;
        // change is not reflected on state level
        database[_address].balance = buffer.balance; // Now, it's reflected
    }

    function updateV3(address _address, uint _balance) public {
        data storage pointer = database[_address]; // reading from map and saving in pointer
        // storage var has direct correspondence to state level. Change here will be reflected back. 
        // It's like pass by reference in JAVA. Chnaging arrays element in a method is reflected back in heap
        pointer.balance = _balance; // reflected at state level
    }

    // returning dynamic type var -- memory
    function get(address _address) public view returns (data memory) { //Data location must be "memory" or "calldata" for return parameter in function, but none was given.
        data memory buffer = database[_address]; 
        return buffer;
    }

    // prams declared call data are non modifiable
    // can save gas fee
    function changeName(address _address, string calldata _name) public {
        data storage pointer = database[_address];
        pointer.name = _name;
    }

    function averageBalance() view public returns (uint) {
        // uint[] memory balance; // cannot declear dynamic sized
        // can we know len of map?
        // is not iteratable

        uint[] memory balance = new uint[](length);
        // uint[] calldata balance = new uint[](length);
        // Type uint256[] memory is not implicitly convertible to expected type uint256[] calldata.


        // how can we check address balance by indices?
        // Use Hash Map
        for (uint i = 0; i < balance.length; i++) {
            balance[i] = database[indices[i]].balance; 
        }

        return average(balance);
        // Invalid type for argument in function call. Invalid implicit conversion from uint256[] memory to uint256[] calldata requested.
    }

    // buffer if is decleared as call data: directly pass it to method
    // if it is decleared as memory; fucntion calling it will copy each element and pass it to method
    function average(uint[] memory buffer) pure private  returns (uint) { // has to updated it to memory bcuz on calling in averageBalance() it was showing error
        uint sum;
        for (uint i = 0; i < buffer.length; i++) {
            sum += buffer[i];
        }
        return (sum / buffer.length);
    }


    // from solidity by example

    // function _f(
    //     // uint[] storage _arr,
    //     // mapping(uint => address) storage _map,
    //     // MyStruct storage _myStruct
    // ) internal { // what is internal ? 'll do later. LOL.
    //     // do something with storage variables
    // }

    // // You can return memory variables
    // function g(uint[] memory _arr) public returns (uint[] memory) {
    //     // do something with memory array
    // }

    // function h(uint[] calldata _arr) external {
    //     // do something with calldata array
    // }
}