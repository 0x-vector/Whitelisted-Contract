// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Whitelist} from "../src/Whitelist.sol";
import {DeployWhitelist} from "../script/DeployWhitelist.s.sol";

contract WhitelistTest is Test {
    Whitelist public whitelist;
    address public PLAYER = makeAddr("player");

    function setUp() public {
        DeployWhitelist deployWhitelist = new DeployWhitelist();
        whitelist = deployWhitelist.run();
    }

    function testOwnerIsCorrect() public {
        assertEq(whitelist.i_owner(), msg.sender);
    }

    function testArrayIsBeingUpdated() public {
        vm.prank(PLAYER);
        whitelist.registerForEligibility();
        address registeredWallets = whitelist.getWallets(0);
        assertEq(registeredWallets == PLAYER);
    }
}
