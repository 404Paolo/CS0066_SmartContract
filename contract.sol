// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasketballStats {
    struct Player {
        string name;
        uint256 gamesPlayed;
        uint256 points;
        uint256 assists;
    }

    mapping(address => Player) public players;
    address[] public playerAddresses;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Add a new player
    function addPlayer(address _playerAddress, string memory _name) public onlyOwner {
        require(bytes(_name).length > 0, "Player name must not be empty");
        require(players[_playerAddress].gamesPlayed == 0, "Player already exists");

        players[_playerAddress] = Player(_name, 0, 0, 0);
        playerAddresses.push(_playerAddress);
    }

    // Update player stats
    function updateStats(
        address _playerAddress,
        uint256 _points,
        uint256 _assists
    ) public onlyOwner {
        Player storage player = players[_playerAddress];
        require(player.gamesPlayed >= 0, "Player does not exist");

        player.gamesPlayed++;
        player.points += _points;
        player.assists += _assists;

        // Assert to check for logical integrity (example use case)
        assert(player.gamesPlayed > 0);
    }

    // Remove a player
    function removePlayer(address _playerAddress) public onlyOwner {
        require(players[_playerAddress].gamesPlayed > 0, "Player does not exist");

        delete players[_playerAddress];

        for (uint256 i = 0; i < playerAddresses.length; i++) {
            if (playerAddresses[i] == _playerAddress) {
                playerAddresses[i] = playerAddresses[playerAddresses.length - 1];
                playerAddresses.pop();
                break;
            }
        }
    }

    // Get player stats
    function getPlayer(address _playerAddress) public view returns (string memory, uint256, uint256, uint256) {
        Player memory player = players[_playerAddress];
        if (bytes(player.name).length == 0) {
            revert("Player does not exist");
        }
        return (player.name, player.gamesPlayed, player.points, player.assists);
    }

    // Retrieve leaderboard
    function leaderboard() public view returns (address[] memory) {
        return playerAddresses;
    }
}
