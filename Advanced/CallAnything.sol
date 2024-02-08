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

    //////////////////////////

    // In order to call a function using only the data field of call, we need to encode:
    // The function name
    // The parameters we want to add
    // Down to the binary level

    // Each contract assigns each function with a function ID. This is known as the "function selector".
    // The "function selector" is the first 4 bytes of the function signature.
    // The "function signature" is a string that defines the function name & parameters.

    address public s_someAddress;
    uint256 public s_amount;

    function transfer(address someAddress, uint256 amount) public {
        s_someAddress = someAddress;
        s_amount = amount;
    }

    function getFunctionSelector() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));

        // o/p => 0x9d61d234
    }
    // bytes("transfer(address,uint256)") => function name and args are converted to bytes
    // then it is hashed using keccack256
    // then it is converted into bytes4

    function getDataToCallTransfer(address someAddress, uint256 amount) public pure returns (bytes memory) {
        // since we already have the selector
        // we can use abi.encodeWithSelector()
        // encodes the given arguments starting from the second and prepends the given four-byte selector

        bytes memory encodedFn = abi.encodeWithSelector(getFunctionSelector(), someAddress, amount);
        return encodedFn;

        // o/p => 0x9d61d2340000000000000000000000007b96af9bd211cbf6ba5b0dd53aa61dc5806b6ace000000000000000000000000000000000000000000000000000000000000007b
        // Now by using the above bytes we can call this fn using call()
        // ().call(encodedFn);
    }

    function callTransferFunctionDirectly(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) =
            address(this).call(abi.encodeWithSelector(getFunctionSelector(), someAddress, amount));
        return (bytes4(returnData), success);
    }

    // Using encodeWithSignature
    function callTransferFunctionDirectlyTwo(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) =
            address(this).call(abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount));
        return (bytes4(returnData), success);
    }
}
