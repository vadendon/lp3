// SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    
    contract BankAccount {
        address public owner;
        uint256 private balance;
    
        event Deposit(address indexed account, uint256 amount);
        event Withdrawal(address indexed account, uint256 amount);
    
        constructor() {
            owner = msg.sender;
            balance = 0;
        }
    
        modifier onlyOwner() {
            require(msg.sender == owner, "Only the owner can perform this action");
            _;
        }
    
        function deposit() public payable {
            require(msg.value > 0, "Deposit amount must be greater than 0");
            balance += msg.value;
            emit Deposit(msg.sender, msg.value);
        }
    
        function withdraw(uint256 amount) public onlyOwner {
            require(amount > 0, "Withdrawal amount must be greater than 0");
            require(amount <= balance, "Insufficient funds");
            balance -= amount;
            payable(owner).transfer(amount);
            emit Withdrawal(msg.sender, amount);
        }
    
        function getBalance() public view returns (uint256) {
            return balance;
        }
    }
