// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EnhancedBasketballStats {
    struct Player {
        string name;
        uint256 points;
    }

    mapping(address => Player) public players;

    // Add or update player stats
    function setPlayer(address _playerAddress, string calldata _name, uint256 _points) external {
        require(_playerAddress != address(0), "Invalid address");
        require(bytes(_name).length > 0, "Player name cannot be empty");

        players[_playerAddress] = Player(_name, _points);

        assert(players[_playerAddress].points >= 0);
    }

    // Retrieve player stats by address
    function getPlayer(address _playerAddress) external view returns (string memory, uint256) {
        Player memory player = players[_playerAddress];
        
        if (bytes(player.name).length == 0) {
            revert("Player does not exist");
        }

        return (player.name, player.points);
    }

    // Remove player stats
    function removePlayer(address _playerAddress) external {
        Player memory player = players[_playerAddress];
        require(bytes(player.name).length > 0, "Player does not exist");
        delete players[_playerAddress];

        // Assert to confirm deletion was successful
        assert(bytes(players[_playerAddress].name).length == 0);
    }
}
