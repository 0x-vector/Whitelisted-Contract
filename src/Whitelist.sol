// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Whitelist {
    string private tokenName = "Ugly Token";
    string private tokenTicker = "UGT";
    uint256 private totalSupply = 1_000_000_000; // total supply is 1B
    uint256 private allocatedTokens = 100 * 10 ** 18;
    address[] public whitelistedAddresses;

    event Transfers(address indexed from, address indexed to, uint256 amount);
    address public i_owner;
    mapping(address => uint256) public balanceOf;

    constructor() {
        i_owner = msg.sender;
        balanceOf[i_owner] = totalSupply;
    }

    function registerForEligibility() public {
        whitelistedAddresses.push(msg.sender);
    }

    function transferTokens(
        address recipient,
        uint256 amount
    ) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance!!");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfers(msg.sender, recipient, amount);
        return true;
    }

    function distributingTokens() public onlyOwner {
        require(
            balanceOf[i_owner] >= allocatedTokens,
            "Not enough tokens to allocate."
        );
        for (uint256 i = 0; i < whitelistedAddresses.length; i++) {
            transferTokens(whitelistedAddresses[i], allocatedTokens);
        }
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "This is not the contract owner.");
        _;
    }

    // ============ STORAGE FUNCTIONS ===========
    function getWallets(uint256 index) public returns (address) {
        return whitelistedAddresses[index];
    }
}
