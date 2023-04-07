// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) public balances;

    // The deposit function allows users to deposit Ether and updates their balance.
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // The withdraw function allows users to withdraw Ether and updates their balance.
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
