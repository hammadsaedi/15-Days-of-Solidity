// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// https://www.youtube.com/watch?v=59MRDldSItU&ab_channel=SmartContractProgrammer
// Custom Errors

contract Foo {
    address public owner;
    uint private foo;

    constructor(address _owner, uint _foo) {
        require(_owner != address(0), "Invalid Address");
        owner = _owner;
        foo = _foo;
    }
    // contructor will throw error if address(0) will be passed
    // 0x0000000000000000000000000000000000000000

    function getFoo() public view returns(uint){
        require(msg.sender != owner, "Not a Owner.");
        assert(foo != 0);
        return foo;
    }
    // Function will throw error if msg.sender is not owner
    // If foo == 0; Transaction reverted
}

contract Bar {
    Foo internal foo;

    constructor(address _address, uint num) {
        try new Foo(_address, num) returns (Foo _foo) {
            foo = _foo;
        } catch { // If address(0) is passed.
            emit Log ("Enable to create Foo.");
        }
    }

    function getFoo() public returns(uint value) {
        try foo.getFoo() returns (uint _value) {
            value = _value;
        } catch Error(string memory reason){ // catch failing revert() and require()
            emit Log (reason);
        } catch (bytes memory reason) { // catch failing assert()
            emit LogV2(reason);
        }
    }
    // function will try to get foo if successful it will return it
    // else return defualt value

    // errors reverts all changes in state made during transaction
    // If we want to save it, try and catch is best for that 

    event Log(string reason);
    event LogV2(bytes reason);
}
// Work fine
// getFoo get executed even if there is error is transaction

// Is there finally keyword in solidty? Enable to find it. ;[ 

// Multiple Catch statements can be added

// For a try there must be catch

// Rest of rules are common