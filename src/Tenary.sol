// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`

            let x := result.slot
            if gt(a, b) {
                sstore(x, 10)
                return(0x00, 0x00)
            }
            if gt(b, c) {
                sstore(x, 20)
                return(0x00, 0x00)
            }
            sstore(x, 30)
        }
    }
}

// contract Tenary {
//     uint256 public result;

//     function main(uint256 a, uint256 b, uint256 c) external {
//         assembly {
//             // your code here
//             // store 10 in the storage variable result if a > b,
//             // else if b > c, store 20,
//             // else, store 30
//             let x := result.slot
//             let v := 30
//             if gt(a, b) {
//                 v := 10
//             }
//             if and(iszero(gt(a, b)), gt(b, c)) {
//                 v := 20
//             }
//             sstore(x, v)
//         }
//     }
// }
