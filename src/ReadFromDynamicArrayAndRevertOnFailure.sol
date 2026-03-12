// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArrayAndRevertOnFailure {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(int256 index) external view returns (uint256) {
        assembly {
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Revert with Solidity panic on failure, use error code 0x32 (out-of-bounds or negative index)
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            let slot := readMe.slot
            let length := sload(slot)
            if or(gt(index, length), eq(index, length)) {
                mstore(0x00, 0x4e487b71) // cast sig 'Panic(uint256)'
                mstore(0x20, 0x32)
                revert(0x1c, 0x24)
            }
            mstore(0x00, slot)
            let hash := keccak256(0x00, 0x20)
            let x := sload(add(hash, index))
            mstore(0x00, x)
            return(0x00, 0x20)
        }
    }
}
