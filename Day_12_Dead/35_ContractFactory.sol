// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Contract that Creates other Contracts
// Contracts can be created by other contracts using the new keyword. Since 0.8.0, new keyword supports create2 feature by specifying salt options.

/**
 * Contract can create another contract
 * 
 * How it's useful?
 * - pass fixed input to new contract
 * - manage many contract from a single contract
 * 
 * Example:
 * - Create new contract
 * - Send Ether and create new contract
 */

// When we deploy same contract many times with diffrent input params
// Want to manage contarcts deployed from same contract


// https://www.youtube.com/watch?v=CyzsUA12ju4&ab_channel=SmartContractProgrammer
// https://www.youtube.com/watch?v=883-koWrsO4&ab_channel=SmartContractProgrammer


// Creates Car
contract CarFactory {
    // Keep all cars in Dynamic Array
    Car[] public cars;

    function createCar(address _owner, string calldata _model) public payable {
        Car car;
        if (msg.value != 0){
            car = (new Car){value: msg.value}(_model, _owner);
            // Creating Car and Sending ETH to that newly creating Car?
        } else {
            car = new Car(_model, _owner);
        }
        // Object Instantiating
        // As we do in JAVA
        // new returns newly created object refrence var here it's address
        
        // Adding in dynamic array
        cars.push(car);
    }
    // contuctor is payable but we can call it with 0 ETH as well
    
    // Overloaded
    function createCar(string calldata _model) public payable {
        Car car;
        if (msg.value != 0){
            car = (new Car){value: msg.value}(_model, msg.sender);
        } else {
            car = new Car(_model, msg.sender);
        }
        cars.push(car);
    }

    function createCar(string calldata _model, bytes32 _salt) public payable {
        Car car;
        if (msg.value != 0){
            car = (new Car){
                value: msg.value, 
                salt: _salt // Random 32bytes of our choise (Can also cast uint to bytes 32 to pass it as salt)
            }
            (
                _model, 
                msg.sender
            );
        } else {
            car = new Car{salt: _salt}(_model, msg.sender);
        }
        cars.push(car);
    }
    // More Details about Salt next time?
    // I'll cover up in projects
    // We can determine address of contract to be deployed before deploying
    
    // get car info
    function getCar(uint index) public view returns (address, string memory, uint){
        Car car = cars[index];
        return (car.owner(), car.model(), address(car).balance);
    }   
    // there is getter functions for feild same as their name
}

// Boiler Plate
contract Car {
    string public model;
    address public owner;

    constructor(string memory _model, address _owner) payable {
        model = _model;
        owner = _owner;
    }
}