// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Bank.sol";
import "./BankProxy.sol";

contract BankApp {
    Bank public bank;
    BankProxy public bankProxy;

    constructor() {
        bank = new Bank();
        bankProxy = new BankProxy(address(bank));
    }

    function deposit() public payable {
        // Use the proxy to deposit funds to the Bank contract
        (bool success, ) = address(bankProxy).call{value: msg.value}(
            abi.encodeWithSignature("deposit()")
        );
        require(success, "Deposit failed");
    }

    function withdraw(uint256 amount) public {
        // Use the proxy to withdraw funds from the Bank contract
        (bool success, ) = address(bankProxy).call(
            abi.encodeWithSignature("withdraw(uint256)", amount)
        );
        require(success, "Withdrawal failed");
    }
}
