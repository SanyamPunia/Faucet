// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {

    // keccak256(key . slot) : hash of 'key'
    mapping (uint => uint) public aa; // slot 0
    mapping (address => uint) public bb; // slot 1

    // keccak256(slot) + index of the item
    uint[] public cc; // slot 2

    uint8 public a = 7; // 1 byte
    uint16 public b = 10; // 2 bytes
    address public c = 0x8D7E48F6FA0d0dC0da45a5982B06Dd21B9065FA8; // 20 bytes
    bool d = true; // 1 byte
    uint64 public e = 15; // 8 bytes
    // 32 bytes, all values will be stored in slot 3
    // 0x 0f 01 8d7e48f6fa0d0dc0da45a5982b06dd21b9065fa8 000a 07

    uint256 public f = 200; // 32 bytes - slot 4
    
    uint public g = 40; // 1 byte - slot 5

    uint256 public h = 789; // 32 bytes - slot 6

    constructor () {
        // called when contract is deployed
        cc.push(1);
        cc.push(10);
        cc.push(100);

        aa[2] = 4; // key = 2
        aa[3] = 10; // key = 3
        bb[0x8D7E48F6FA0d0dC0da45a5982B06Dd21B9065FA8] = 100;
    }
}