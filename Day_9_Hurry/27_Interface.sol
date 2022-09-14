// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/**
 * Interface
 * You can interact with other contracts by declaring an Interface.
 * 
 * Interface
 * 
 * cannot have any functions implemented
 * can inherit from other interfaces
 * all declared functions must be external
 * cannot declare a constructor
 * cannot declare state variables
*/

// These are like API to interact with other smart contract
// Function will be external as these are going to be access by third party contract. (Second Part would be Inherited LOL)

// Cannot implement body
// As these are just boiler plates. Actual execution will take place by contract

// Cannot decalre custructor
// We are not instantiating contract
// We are just making interface to interact

// cannot not declare state var
// Use getter for that
// With same names?

// How solidity will know which contract is going to be access
// Just by interface? Abv Not
// We have to pass contract Address

// Execution by third party contract will reflect changes in first one

// Can acess code it it not in same file
// As we are intracting with deplyed one it ghas nothing to do with source code


// We'll call this contract functionality by third party contract
contract Counter { // First Party
    uint public count; // state var

    function increment() external { // external function
        count += 1;
    }
}

contract Child is Counter { // Second Party
    // have functions of Counter
} // We can execute it's function (Parental Function) by Interface as afrer compilations they are going to  by it's own



// Let's first Make Interface to have interactions
interface API {
    function count() external view returns(uint); // getter with same name as of state var
    function increment() external; // Just defination of functions
}

// Third Party contract
contract MySelf {
    function incrementCounter(address _counter) external { // Executor of third party function
        API(_counter).increment(); // Accessing through API
    }

    function getCount(address _counter) external view returns (uint) { // state var getter
        return API(_counter).count();
    }

    // Can have it's own function too
}

// Works Fine
// till here

// can we call public function
// Private and internal will not be abvs
// Yes, its

// Change in state by either contarct itself or any other other will be reflected on chain 


// Classical Uni Swap Example

// APIs

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f; // Uni swap factoray contarct address
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F; // Dia 
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Wrapped Ether

    function getTokenReserves() external view returns (uint, uint) { 
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
    // Whats is token reserve, Now?

}

// Copy Pasted from Solidity-by-Example
// Does not know here these conatrct are deployed;
// But we can choose chain of over choice and use there contract address


// Will do this stuff later own
// After understanding of uniswap infra