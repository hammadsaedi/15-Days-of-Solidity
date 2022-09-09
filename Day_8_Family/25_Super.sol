// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Super
// Parent contracts can be called directly, or by using the keyword super.
// By using the keyword super, all of the immediate parent contracts will be called.

// Breath- First is also applied here


contract Foo {
    // Functions are not allowed to have the same name as the contract. If you intend this to be a constructor, use "constructor(...) { ... }" to define it.
    function foo() public pure virtual returns(uint) {
        return 1;
    }
}

contract Bar is Foo {
    function foo() public pure virtual override returns(uint) {
        return 2;
    }

    function bar() public pure virtual returns(uint) {
        return super.foo();
    } // return 1
}

contract Baz is Bar {
    function foo() public pure override returns(uint) {
        return 3;
    } 

    function bar() public pure override returns(uint) {
        return super.foo();
    } // return 2

    function barReCall() public pure returns(uint) {
        return super.bar();
    } // return 1
}

contract Quz is Foo, Bar {
    function foo() public pure virtual override(Foo, Bar) returns(uint) {
        return super.foo();
    } // Return 1 or 2
    // return 2
    // Breath First Search
    // Quz is child of Foo and Bar, while calling super it check right one first (breath-first)
} // bar() is also present here; from "Bar" which return 1 bcuz it call foo() of "Foo" by super keyword




// By Solidty-by-example

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    // This is called an event. You can emit events from your function
    // and they are logged into the transaction log.
    // In our case, this will be useful for tracing function calls.
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.

    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}