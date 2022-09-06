// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

/** 
 * You can define your own type by creating a struct.
 * They are useful for grouping together related data.
 * Structs can be declared outside of a contract and imported in another contract.
*/


// Like enums it can be declared in / out contract and seperate file
contract Todo {
    // Task:
    //      - string: discription
    //      - status: Done? / Pending === true, false
    // can also use enums for that
    // Task can be: - Todo, Pending, Done, Deleted, etc.
    struct Task {
        string task;
        bool status;
    }

    // arrys to HODL Tasks
    Task[] public database; // dynamic size array

    // Creation of Taks
    // Three ways to initialize task
    // - calling it like a function
    function createTask(string memory _task) public {
        database.push(Task(_task, false)); // adding task in dynamic array
    }

    // key value mapping
    function createTaskV2(string memory _task) public {
        // JSON? LOL. 
        database.push(
            Task(
                {
                    task: _task, 
                    status: false
                }
            )
        ); // adding task in dynamic array
    }

    // initialize an empty struct and then update it
    function createTaskV3(string memory _task) public {
        Task memory buffer;
        buffer.task = _task; 
        // buffer.status is false by default
        database.push(buffer);
    }


    // Mark task done
    function markDone(uint index) public {
        database[index].status = true;
    }

    // Alter status
    function toggleTask(uint index) public {
        database[index].status = !database[index].status;
        // In solidity-by-examples:
        // Todo storage todo = todos[_index];
        // todo.completed = !todo.completed;
        // more on storage next time 
    }

    // returning struct.
    function getTask(uint index) public view returns (Task memory){
        return database[index];
    }

    // ABI support? Later on. LOL.
    // Try V2
    function getTaskV2 (uint index) public view returns (string memory, bool){
        return (database[index].task, database[index].status);
        // In example:
        // Todo storage todo = todos[_index];
        // return (todo.text, todo.completed);
    } // Solidty can return multiple types data, how cool it is?
    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.

    // Change text contant of Task
    function updateTask(uint index, string memory _task) public {
        database[index].task = _task;
    }

    // In example: solidity-by-example
    function updateTextV2(uint index, string calldata _task) public {
        Task storage buffer = database[index];
        buffer.task = _task;
    }
}
// All version of functions are working fine in remix as they are supposed to be
// May be, may be, while dealing with ABI and other dev stuff they would have different use case
// 'll see you later