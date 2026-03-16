// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            let mask := sub(not(0), shl(64, 0xffffffffffffffff))
            let val := and(mask, sload(writeHere.slot))
            let val2 := shl(64, v)
            sstore(writeHere.slot, or(val, val2))

            // let slot := writeHere.slot
            // let data := sload(slot)
            // let clearMask := not(shl(64, 0xffffffffffffffff))
            // data := and(data, clearMask)
            // let shifted := shl(64, v)
            // sstore(slot, or(data, shifted))
        }
    }
}
