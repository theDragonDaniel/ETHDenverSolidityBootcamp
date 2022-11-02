// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract VolcanoCoin is Ownable {


    //address owner;
    uint256 initialSupply = 10000;
    uint256 totalSupply = initialSupply;
    mapping(address => uint256) public balances;
    mapping(address => Payment[]) public payments;

    struct Payment {
        address userAddress;
        uint256 userAmount;
    }

    Payment[] public transfers;


    constructor() {
        //owner = msg.sender;
        balances[msg.sender]=totalSupply;

    }

    event totalSupplyChange(uint256);
    event transferDone(uint256, address);

    function getTotalSupply() public view returns (uint256){
        return totalSupply;
    }

    function addSupply() public onlyOwner {
        totalSupply += 1000;
        emit totalSupplyChange(totalSupply);
    }

    function transfer(address recipient, uint256 amount) public {
        balances[msg.sender] = balances[msg.sender] - amount;

        balances[recipient] = balances[recipient] + amount;
        emit transferDone(amount, recipient);
        transfers.push(Payment({userAddress:recipient,userAmount:amount}));
        //payments[msg.sender].push(Payment({userAddress:recipient,userAmount:amount}));
        recordPayment(msg.sender,recipient,amount);
    }
    function paymentLookup(address _address) public view returns (Payment[] memory){
        return payments[_address];
    }

    function recordPayment(address _sender, address _recipient, uint256 _amount) private {
        payments[_sender].push(Payment({userAddress:_recipient,userAmount:_amount}));
    }


    }
