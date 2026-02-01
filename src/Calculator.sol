// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Calculator {
    // perform the arithmetic operations assumming they won't overflow or underflow
    // the list of math operations can be found here:
    // https://docs.soliditylang.org/en/latest/yul.html#evm-dialect

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // add x and y
            let z := add(x,y)
            mstore(0x00, z)
            return(0x00, 0x20)
        }
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // subtract y from x
            let z := sub(x,y)
            mstore(0x00, z)
            return(0x00, 0x20)
        }
    }

    function mul(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // multiply x by y
            let z := mul(x,y)
            mstore(0x00, z)
            return(0x00, 0x20)
        }
    }

    function div(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // div x by y
            let z := div(x,y)
            mstore(0x00, z)
            return(0x00, 0x20)
        }
    }
}
