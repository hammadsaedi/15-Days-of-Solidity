// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// import
import "./14_b_EnumsImport.sol";
// Paths

contract Enums {
    /**
     * Solidity supports enumerables and they are useful to model choice and keep track of state.
     * Enums can be declared outside of a contract.
    */
   // Like it work in JAVA?
   
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled 
    }

    // defualt value for enum is first one
    // definition of the type, in this case "Pending"
    Status public status;
    // Intantialting?

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4


    // Since enum types are not part of the ABI, the signature of "get"
    // will automatically be changed to "get() returns (uint8)"
    // for all matters external to Solidity. The integer type used is just
    // large enough to hold all enum values, i.e. if you have more values,
    // `uint16` will be used and so on.
    function get() public view returns (Status) {
        return status;
    }

    // Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
    // Mistake in solidity docs 
    function getV2() public view returns (uint) {
        return uint(status);
    }

    // Updates status by passing status value
    function set(Status _status) public {
        status = _status;
    }

    // Updating specific enum
    function cancle() public {
        status = Status.Canceled;
        // status ==== instance
        // Status ==== enums name
    }

    // delete reset enum; means set to first one
    function reset() public {
        delete status;
    }



    // Trying enums which are declared outside contract
    Boolean private boolean;

    function getBool() public view  returns (uint){
        return uint(boolean);
    }
    // works fine


    // Trying enums declared in other file
    Life public life;

    function getLife() public view returns (Life) {
        return life;
    }

    // works fine

}


/**
 * Enums are one way to create a user-defined type in Solidity. 
 * They are explicitly convertible to and from all integer types but implicit conversion is not allowed. 
 * The explicit conversions check the value ranges at runtime and a failure causes an exception. 
 * Enums needs at least one member.
*/

// Can be declares out side of contract
enum Boolean {
    FALSE,
    TRUE,
    NULL
}

// constructor for enums ???
// In java it's supported. But, it seems that it's not in solidity