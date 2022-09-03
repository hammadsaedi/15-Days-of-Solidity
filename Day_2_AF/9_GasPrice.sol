/** 
 * How much ether do you need to pay for a transaction?
 * 
 * You pay gas spent * gas price amount of ether, where
 * 
 *      -> gas is a unit of computation
 *      -> gas spent is the total amount of gas used in a transaction
 *      -> gas price is how much ether you are willing to pay per gas
 * 
 * Transactions with higher gas price have higher priority to be included in a block.
 * Unspent gas will be refunded.
 * 
 * Gas Limit
 * There are 2 upper bounds to the amount of gas you can spend
 * 
 * gas limit (max amount of gas you're willing to use for your transaction, set by your
 * block gas limit (max amount of gas allowed in a block, set by the network)
 * 
 * 
 * Gas Info.
 * https://www.ethgasstation.info/
 */

 // SPDX-License-Identifier: SEE LICENSE IN LICENSE
 pragma solidity ^0.8.13;

 contract ETHgas {
    uint public i;


    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        while(true){ 
            // Here we run a loop until all of the gas are spent
            // and the transaction fails
            // transaction will fail once there will no ETH to pay for gas
            i++;
        }
    }


    // Is recursion is allowd?
    // O Yeah. Allowed.
    function infinite() public {
        infinite();
    }

    // Can we track user balance and allow them to execute function if they have enough gas fee?
    // Why you are trying at this level? LOL?
    function finite() public {
        if (msg.sender.balance > 99999999999999999999) { // LOL. (I just can use msg.sender.balance >= 100)
            i++; // To track how much time fucntion was called. ;)
            // Still Zero? Why?
            // Why it's not working? Fu*k.
            finite();
        }
    } // It should run one time only; As Balnace is 100 ETH at this time
    // 99999999999999999999 == 99999999999.999999999 gwei == 99.999999999999999999 ether
    // http://eth-converter.com/


    // Lets Test msg.msg.sender.balance
    function balance() public view returns (uint) {
        return msg.sender.balance;
    } // Remix UI showing 100 ETH; But, Again and agian balance() returns 99999999999997000000
    // Why?
    // Kesi teri khud gharzi? :(

 }

 // Could not test infinite and forever. Remix was not responding. ;(
