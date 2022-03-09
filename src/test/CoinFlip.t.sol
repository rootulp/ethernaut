// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../CoinFlip/CoinFlipSolution.sol";
import "../CoinFlip/CoinFlipFactory.sol";
import "../Ethernaut.sol";

contract CoinFlipTest is DSTest {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    Ethernaut ethernaut;

    function setUp() public {
        // Setup instance of the Ethernaut contracts
        ethernaut = new Ethernaut();
    }

    function testCoinFlipSolution() public {
        // Setup
        CoinFlipFactory coinFlipFactory = new CoinFlipFactory();
        ethernaut.registerLevel(coinFlipFactory);
        vm.startPrank(tx.origin);
        address levelAddress = ethernaut.createLevelInstance(coinFlipFactory);

        // Solution
        vm.roll(0);
        CoinFlipSolution coinFlipSolution = new CoinFlipSolution(payable(levelAddress));

        for (uint i=1; i <= 10; i++) {
            vm.roll(i);
            coinFlipSolution.solve();
        }

        // Verify
        bool levelSuccessfullyPassed = ethernaut.submitLevelInstance(payable(levelAddress));
        vm.stopPrank();
        assert(levelSuccessfullyPassed);
    }
}
