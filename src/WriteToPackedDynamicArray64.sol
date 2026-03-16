// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPackedDynamicArray64 {
    uint64[] public writeHere;

    function main(
        uint64 v1,
        uint64 v2,
        uint64 v3,
        uint64 v4,
        uint64 v5
    ) external {
        assembly {
            // your code here
            // write the code to store v1, v2, v3, v4, and v5 in the `writeHere` array in sequential order.
            // Hint: `writeHere` is a dynamic array, so you will need to access its length and use `mstore` or `sstore`
            // appropriately to push new values into the array.

            let slot := writeHere.slot
            mstore(0x00, slot)
            let hash := keccak256(0x00, 0x20)
            let val := 0
            val := or(val, v1)
            val := or(val, shl(64, v2))
            val := or(val, shl(128, v3))
            val := or(val, shl(192, v4))
            sstore(hash, val)
            sstore(add(hash, 1), v5)
            sstore(slot, 5)
        }
    }
}
