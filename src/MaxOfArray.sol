// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            let len := mload(arr)
            if eq(len,0) {
                revert(0x00, 0x00)
            }
            let max := mload(add(arr, 0x20))
            let val
            let i := 1
            for {} lt(i, len) {i := add(i, 1)} {
                val := mload(add(arr, add(mul(i, 0x20), 0x20)))
                if lt(max, val) {
                    max := val
                }
            }
            mstore(0x00, max)
            return(0x00, 0x20)
        }
    }
}

//////////// GAS OPTIMIZED ///////////////

// contract MaxOfArray {
//     function main(uint256[] memory arr) external pure returns (uint256) {
//         assembly {
//             let len := mload(arr)
//             if iszero(len) { revert(0, 0) }

//             // p points to arr[0]
//             let p := add(arr, 0x20)
//             let end := add(p, mul(len, 0x20))

//             // max = arr[0]
//             let max := mload(p)

//             // advance to arr[1]
//             p := add(p, 0x20)

//             for { } lt(p, end) { p := add(p, 0x20) } {
//                 let v := mload(p)
//                 if gt(v, max) { max := v }
//             }

//             mstore(0x00, max)
//             return(0x00, 0x20)
//         }
//     }
// }