
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SpiderManGame is Ownable {
    address public spiderMan;
    uint256 public numPlayers;
    bool public gameInProgress;

    event PlayerJoined(address player);
    event VillainDefeated(address villain);

    constructor(address initialOwner) Ownable(initialOwner) {
        spiderMan = initialOwner;
        gameInProgress = false;
        numPlayers = 0;
    }

    function joinGame() public {
        require(!gameInProgress, "Game is already in progress");
        numPlayers++;
        emit PlayerJoined(msg.sender);
    }

    function startGame() public onlyOwner {
        require(numPlayers >= 1, "Minimum one player required to start the game");
        gameInProgress = true;
    }

    function defeatVillain() public onlyOwner {
        require(gameInProgress, "No game in progress");
        emit VillainDefeated(msg.sender);
        gameInProgress = false;
    }

    function endGame() public onlyOwner {
        gameInProgress = false;
    }
}
