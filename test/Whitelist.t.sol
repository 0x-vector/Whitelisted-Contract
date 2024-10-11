// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Whitelist} from "../src/Whitelist.sol";
import {DeployWhitelist} from "../script/DeployWhitelist.s.sol";

contract WhitelistTest is Test {
    Whitelist public whitelist;

    function setUp() public {
        whitelist = new Whitelist();
    }

    function testOwnerIsCorrect() public {
        assertEq(whitelist.i_owner(), msg.sender);
    }

    function testArrayIsBeingUpdated() public {
        assertEq(whitelist.whitelistedAddresses(), []);
        whitelist.registerForEligibility();
        assertEq(whitelist.whitelistedAddresses(), msg.sender);
    }
}
