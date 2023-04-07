// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Car.sol";
contract CarFactory {
    // This mapping associates an owner's address with an array of Car contracts.
    mapping(address => Car[]) public ownerCars;
    // The createCar function accepts the model of the car and creates a new instance of the Car contract.
    function createCar(string memory _model) public {
        Car newCar = new Car(msg.sender, _model);
        ownerCars[msg.sender].push(newCar);
    }
    // The getOwnerCars function retrieves the Car contracts associated with an owner's address.
    function getOwnerCars(address _owner) public view returns (Car[] memory) {
        return ownerCars[_owner];
    }
}