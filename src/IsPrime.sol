// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers
            if eq(x,1) {
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
            if eq(mod(x,2),0) {
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
            if eq(mod(x,3),0) {
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
            let i := 5
            for {} lt(i, div(x,2)) {} {
                if eq(mod(x, i),0) {
                    mstore(0x00, 0x00)
                    return(0x00, 0x20)
                }
                i := add(i, 2)
            }
            mstore(0x00, 0x01)
            return(0x00, 0x20)
        }
    }
}
