// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Whitelist {
    uint256 private totalSupply = 1 * 10 ** 9;
    uint256 private allocatedTokens = 100;
    address[] private whitelistedAddresses;

    address public i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function registerForEligibility() public {
        whitelistedAddresses.push(msg.sender);
    }

    function distributingTokens() public {
        for (uint256 i = 0; i < whitelistedAddresses.length; i++) {}
    }

    function claimTokens() public view returns (bool) {
        for (uint256 i = 0; i < whitelistedAddresses.length; i++) {
            require(
                whitelistedAddresses[i] == msg.sender,
                "You're not Eligible"
            );
        }
    }
}
