// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// FACTORY PATTERNS

contract Car {
    address public owner;
    string public model;

    // The constructor sets the owner and model of the car.
    constructor(address _owner, string memory _model) {
        owner = _owner;
        model = _model;
    }
}
