// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Settings {
    address public admin;
    uint256 public gasPrice;

    // The constructor sets the initial admin and gas price.
    constructor(address _admin, uint256 _gasPrice) {
        admin = _admin;
        gasPrice = _gasPrice;
    }

    // The setGasPrice function allows the admin to update the gas price.
    function setGasPrice(uint256 _gasPrice) public {
        require(msg.sender == admin, "Only admin can set gas price");
        gasPrice = _gasPrice;
    }
}
