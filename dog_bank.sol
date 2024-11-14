// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank{
    mapping(address=>uint) private balances;

    function deposit() public payable
    {
        require(msg.value>0,"Amount should be greater than 0");
        balances[msg.sender]+=msg.value;
    }

    function withdraw(uint amount) public
    {
        require(amount>0,"Amount to withdraw should be greater than 0");
        require(balances[msg.sender]>amount,"Insufficient Balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender]-=amount;
    }

    function show_balance() public view returns (uint){
        return balances[msg.sender];
    }
}