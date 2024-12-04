# Basketball Stats Tracker

## Purpose
This project is a basketball-themed smart contract to manage player statistics and a leaderboard. It uses Solidity to demonstrate `require()`, `assert()`, and `revert()` statements for better error handling.


## Functions
- **setPlayer()**: Adds a new player. Uses `require()` to check preconditions.
- **removePlayer()**: Removes a player. Uses `require()` for validation.
- **getPlayer()**: Retrieves player statistics. Uses `revert()` for nonexistent players.
