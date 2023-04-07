// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Bank.sol";

contract BankProxy {
    address public target;
    address public owner;

    // The constructor sets the initial target contract and the owner of the proxy.
    constructor(address _target) {
        target = _target;
        owner = msg.sender;
    }

    // The updateTarget function allows the owner to update the target contract.
    function updateTarget(address _target) public {
        require(msg.sender == owner, "Only owner can update the target");
        target = _target;
    }

    // The fallback function forwards any calls to the target contract using delegatecall.
    fallback() external payable {
        (bool success, ) = target.delegatecall(msg.data);
        require(success, "Call to target contract failed");
    }
}
