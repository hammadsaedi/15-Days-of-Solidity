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

    
    //Let's try with this 99999999999997000000 balance logic; with brand new wallet. 
    function finiteV2() public {
        if (msg.sender.balance >= 99999999999997000000) {
            i++;
            finiteV2();
        }
    } // still not working; executing this method charge fee. But; Does not updates "i" - state variable.
    // Its bcz it is supposed to change the state. But cant bcz; condition is not triggered.


    // Try bool flag
    bool public flag = msg.sender.balance >= 99999999999997000000; // It's value is true;
    // New Remix Wallet has 100 ETH in GUI. 
    // But from balance() which is free of gas fucntion it's 99999999999997000000 gwei 
    // On deploying contract; state variable value is set. Gas is payed at that time. 
    // On accessing this state var; no fee is paid. 
    
    // while calling finiteV2() function; gas fee was paid, which was paid by fuunction caller wallet.
    // This function does not make change in any state. But, still fee is deducted. 
    // Bcz, it is supposed to change the state, so, it costs fee 
    // This fee cost decrement balance and make condition false
    // Before Execution: 99999999999997000000
    // After Execution:  99999999999996975463

    
    // Try  99999999999996975463 logic 
    function finiteV3() public{
        if (msg.sender.balance >= 99999999999996975463) {
            i++;
            finiteV3();
        }
    } // i is still not updated.

    // Jan ni chadni teri. ;)

    // Lets try something a little bit different
    uint private callerBalance;
    function finiteV4() public{
        callerBalance = msg.sender.balance;
        if (msg.sender.balance >= callerBalance) { // It'll check; balance is equal when fucntion was called first time;
            i++;
            finiteV4();
        }
    } // Remix Crashed. HAHA. LOL. 
    // There is no difference;
    // bcuz; callerBalance is being updated every time

    // I can also play around gas fee etc. paying. wo phr kabhi sia.

    // Very Intresting Game, its. ;}

    // Here, we go again. I was on break. Back with new ideas.abi


    // try Iteratively, with V4 Logic
    function finiteV5() public {
        uint temp = msg.sender.balance;
        while (msg.sender.balance >= temp) { // It'll check; balance is equal when fucntion was called first time;
            i++;
        }
    } // It should run one time. and Update i. O God. This time it should run. If not. I have aonther Idea.
    // O God. Remix is not responding. :(
    // Why this time?
    // It should work


    // Let try another recursion
    function finiteV6() public returns (uint){
        if( i > 0){
            return i;
        }
        i++;
        return finiteV6();
    }
    // Again Not Responding. HAHA. Don't have idea. What reason. 
    // O, forget; i++ incrementation. Added Now;
    // Finally, it updated i.


    // But, why msg.sender logic is not working
    // will try later on

    // More General
    function finiteV7(uint n) public returns (uint){ // incrementor; at state level (n + 1)
        if( i > n){
            return i;
        }
        i++;
        return finiteV7(n);
    }

    // Another try
    function finiteV8() public {
        uint temp = msg.sender.balance;
        while (msg.sender.balance >= temp) { // It'll check; balance is equal when fucntion was called first time;
            i++;
        }
    }
    // I think, msg.sender.balance is not get updated while execution of fumction

    // Let's check this;
    uint public balanceAtV9;
    function finiteV9() public { // ran out of names. HAHA
        int j = 0;
        while(j < 10){
            balanceAtV9 = msg.sender.balance;
            j++; // local var
            i++; // state
        }
    }
    // After executing this function will check both variables.
    // Before Execution:
    // balance = 99999999999995744461
    // balanceAtV9 = 0
    //
    // After Execution:
    // balance = 99999999999995671779
    // balanceAtV9 = 99999999999998660876

    
    // what the heck.
    // balance < balanceAtV9


    // fucntion was not perfect
    // try this
    uint public balanceAtV10;
    function finiteV10() public { // ran out of names. HAHA
        int j = 0;
        while(j < 10){
            j++; // local var
            i++; // state
        }
        balanceAtV10 = msg.sender.balance;
    }
    // Before Execution:
    // balance = 99999999999995195953
    // balanceAtV10 = 0
    //
    // After Execution:
    // balance = 99999999999995125240
    // balanceAtV10 = 99999999999998114633
    
    // msg.sender.balance is not same for all?



    // All right, played much enough. Will try this topic next time.
 }

 // Could not test infinite and forever. Remix was not responding. ;(
