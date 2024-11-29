# Basketball Stats Tracker

## Purpose
This project is a basketball-themed smart contract to manage player statistics and a leaderboard. It uses Solidity to demonstrate `require()`, `assert()`, and `revert()` statements for better error handling.

## Features
1. Add players with their name and address.
2. Update player statistics such as points and assists.
3. Remove players from the system.
4. Retrieve individual player statistics.
5. View the leaderboard (list of player addresses).

## Functions
- **addPlayer()**: Adds a new player. Uses `require()` to check preconditions.
- **updateStats()**: Updates statistics for a player. Uses `require()` and `assert()`.
- **removePlayer()**: Removes a player. Uses `require()` for validation.
- **getPlayer()**: Retrieves player statistics. Uses `revert()` for nonexistent players.
- **leaderboard()**: Returns the list of player addresses.
