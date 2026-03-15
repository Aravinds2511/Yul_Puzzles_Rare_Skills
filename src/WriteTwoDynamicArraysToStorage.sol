// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`

            let slot1 := writeHere1.slot
            let slot2 := writeHere2.slot
            mstore(0x00, slot1)
            let hash1 := keccak256(0x00, 0x20)
            mstore(0x00, slot2)
            let hash2 := keccak256(0x00, 0x20)
            let length1 := x.length
            let length2 := y.length
            sstore(slot1, length1)
            sstore(slot2, length2)

            let length := length2
            if gt(length1, length2) {
                length := length1
            }

            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 1)
            } {
                if lt(i, length1) {
                    let s := add(hash1, i)
                    let val := calldataload(add(x.offset, mul(0x20, i)))
                    sstore(s, val)
                }
                if lt(i, length2) {
                    let s := add(hash2, i)
                    let val := calldataload(add(y.offset, mul(0x20, i)))
                    sstore(s, val)
                }
            }
        }
    }
}

// assembly {
//             // your code here
//             // write the dynamic calldata array x to storage variable writeHere1 and
//             // dynamic calldata array y to storage variable writeHere2

//             let slot1 := writeHere1.slot
//             let slot2 := writeHere2.slot
//             mstore(0x00, slot1)
//             let hash1 := keccak256(0x00, 0x20)
//             mstore(0x00, slot2)
//             let hash2 := keccak256(0x00, 0x20)
//             sstore(slot1, x.length)
//             sstore(slot2, y.length)

//             for {
//                 let i := 0
//             } lt(i, x.length) {
//                 i := add(i, 1)
//             } {
//                 let s := add(hash1, i)
//                 let val := calldataload(add(x.offset, mul(0x20, i)))
//                 sstore(s, val)
//             }
//             for {
//                 let i := 0
//             } lt(i, y.length) {
//                 i := add(i, 1)
//             } {
//                 let s := add(hash2, i)
//                 let val := calldataload(add(y.offset, mul(0x20, i)))
//                 sstore(s, val)
//             }
//         }
