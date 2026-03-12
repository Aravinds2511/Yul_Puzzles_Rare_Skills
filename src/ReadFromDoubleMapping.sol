// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDoubleMapping {
    mapping(address user => mapping(address token => uint256)) public balances;

    function setValue(address user, address token, uint256 value) external {
        balances[user][token] = value;
    }

    function main(address user, address token) external view returns (uint256) {
        assembly {
            // your code here
            // read and return the `token` balance of `user` in the double mapping `balances`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            let slot := balances.slot
            mstore(0x00, user)
            mstore(0x20, slot)
            let p1 := keccak256(0x00, 0x40)
            mstore(0x00, token)
            mstore(0x20, p1)
            let hash := keccak256(0x00, 0x40)
            let x := sload(hash)
            mstore(0x00, x)
            return(0x00, 0x20)
        }
    }
}
