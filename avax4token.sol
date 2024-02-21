// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SpiderManGame is ERC20Burnable, Ownable {
    mapping(address => uint256) public killCount;
    mapping(address => bool) public rewardsRedeemed;

    event PlayerKilled(address indexed player, uint256 enemies);
    event RewardsIssued(address indexed player, uint256 rewards);
    event RewardsRedeemed(address indexed player);

    constructor(address initialOwner) Ownable(initialOwner) ERC20("SpiderManToken", "SPM") {
        _mint(msg.sender, 1000000 * 10 ** uint(decimals()));
    }

    function collectKillCount(address player, uint256 enemies) public onlyOwner {
        killCount[player] += enemies;
        emit PlayerKilled(player, enemies);
    }

    function issueRewards(address player, uint256 rewards) public onlyOwner {
        rewardsRedeemed[player] = false;
        _mint(player, rewards);
        emit RewardsIssued(player, rewards);
    }

    function redeemRewards() public {
        require(!rewardsRedeemed[msg.sender], "Rewards already redeemed");
        rewardsRedeemed[msg.sender] = true;
        emit RewardsRedeemed(msg.sender);
    }

    function burn(uint256 amount) public onlyOwner override {
        _burn(msg.sender, amount);
    }
    
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function transferTokens(address recipient, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, recipient, amount);
    }
}
