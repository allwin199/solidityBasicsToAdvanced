// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CallAnything {
    // Solidity has some more "low-level" keywords, namely "staticcall" and "call".

    // call: How we call functions to change the state of the blockchain.
    // staticcall: This is how (at a low level) we do our "view" or "pure" function calls, and potentially don't change the blockchain state.

    // When you call a function, you are secretly calling "call" behind the scenes, with everything compiled down to the binary stuff
    // for you. Flashback to when we withdrew ETH from our raffle:

    function withdraw(address recentWinner) public {
        (bool success,) = recentWinner.call{value: address(this).balance}("");
        require(success, "Transfer Failed");
    }

    // - In our {} we were able to pass specific fields of a transaction, like value.
    // - In our () we were able to pass data in order to call a specific function - but there was no function we wanted to call!
    // We only sent ETH, so we didn't need to call a function!
    // If we want to call a function, or send any data, we'd do it in these parathesis!
}
