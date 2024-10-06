// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to store balances
    mapping(address => uint256) private balances;
    
    // Address of the contract owner
    address public owner;
    
    // Constructor to initialize the contract with the owner's account
    constructor(uint256 initialBalance) payable {
        require(msg.value >= initialBalance, "Insufficient Ether sent to match initial balance.");
        owner = msg.sender; // Owner of the contract is the account that deploys it
        balances[owner] = initialBalance; // Set the initial balance for the owner
    }

    // Function to get the balance of the sender
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Function to deposit ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero.");
        balances[msg.sender] += msg.value;
    }

    // Function to withdraw ether from the contract
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
