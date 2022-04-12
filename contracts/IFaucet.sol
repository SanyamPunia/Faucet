// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// interface cannot inherit from other smart contracts
// only inherit from other interfaces

// interface cannot declare a constructor
// interface cannot declare state variables
// all declared functions have to be external   

interface IFaucet {
    function addFunds() payable external;
    function withdraw(uint withdrawAmount) external;
 }