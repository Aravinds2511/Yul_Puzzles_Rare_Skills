// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`

            // calldata structure -> selecltor(4bytes), offset(20bytes), length, array_elements
            // For calldata parameters, Solidity already exposes: x.offset, x.length
            let slot := writeHere.slot
            mstore(0x00, slot)
            let hash := keccak256(0x00, 0x20)
            sstore(slot, x.length)
            for {
                let i := 0
            } lt(i, x.length) {
                i := add(i, 1)
            } {
                let s := add(i, hash)
                let val := calldataload(add(x.offset, mul(i, 0x20)))
                sstore(s, val)
            }
        }
    }
}
