// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            let slot := pushToMe.slot
            mstore(0x00, slot)
            let hash := keccak256(0x00, 0x20)
            let length := sload(slot)
            sstore(add(hash, length), newValue)
            length := add(1, length)
            sstore(slot, length)
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}
