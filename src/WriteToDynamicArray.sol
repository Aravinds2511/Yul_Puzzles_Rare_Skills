// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            let s := writeHere.slot
            let length := mload(x) // length stored here after 4 bytes function selector and 20 bytes offset
            sstore(s, length)
            mstore(0x00, s)
            let hash := keccak256(0x00, 0x20)
            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 1)
            } {
                let element := mload(add(add(x, 0x20), mul(i, 0x20)))
                sstore(add(hash, i), element)
            }
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
