// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {Whitelist} from "../src/Whitelist.sol";

contract DeployWhitelist is Script {
    Whitelist public whitelist;

    // function setUp() public {}

    function run() public {
        vm.startBroadcast();
        whitelist = new Whitelist();
        vm.stopBroadcast();
    }
}
