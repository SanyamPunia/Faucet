// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    uint256 public numOfFunders;

    mapping(address => bool) private funders;
    mapping(uint256 => address) private lutFunders;

    modifier limitWithdraw(uint256 withdrawAmount) {
        require(
            withdrawAmount <= 100000000000000000,
            "Cannot withdraw more than 0.1 ether"
        ); // this is a condition to be met in order to move ahead
        _;
    }

    function test1() external onlyOwner {
        // admin access only
    }

    // private => can be accessible only within the smart contract
    // internal => can be accessible within smart contract and also derived smart contract

    function emitLog() public override pure returns(bytes32) {
        return "Hello World";
    }

    receive() external payable {} // called when you make a transaction that doesn't specify funciton name to call

    function addFunds() external override payable {
        // payable allows the function to perform transactions when called
        address funder = msg.sender;

        if (!funders[funder]) {
            uint256 index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdraw(uint withdrawAmount) override external limitWithdraw(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);

        for (uint256 i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutFunders[index];
    }

    // view, pure - read-only call, no gas fee
    // view - it indicates that the function will not alter the storage state in any way
    // pure - even more strict, indicating that it won't even read the storage state

    // Transaction (can generate state changes) and require gas fee
    // read-only call, no gas fee
}

// const instance = await Faucet.deployed()
// instance.addFunds({from: accounts[0], value: "2000000000000000000"})
// instance.withdraw("500000000000000000", {from: accounts[1]})
