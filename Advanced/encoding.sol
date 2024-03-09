// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// For the cheatsheet, check out the docs: https://docs.soliditylang.org/en/v0.8.13/cheatsheet.html?highlight=encodewithsignature

contract Encoding {
    // Concatenating 2 string using abi.encodePacked()
    function combineStrings() public pure returns (string memory) {
        string memory stringValue = string(abi.encodePacked("Hello, World! ", "Let's Code"));
        return stringValue;

        // "Hello, world" and "Let's Code" are 2 different strings
        // when we are doing abi.encodePacked();
        // We are encoding 2 differnt strings into one in its bytes form
        // 2 different strings are converted to one single byte
        // abi.encodePacked() returns a byte object
        // finally we are typecasting it to a string
        // o/p => Hello, World Let's Code
        // By following the above steps we have concatenated 2 strings
    }

    // In solidity 0.8.12+ below method can be used to concatenate 2 strings
    // Concatenating 2 string using string.concat()
    function concateneateStrings() public pure returns (string memory) {
        string memory stringValue = string.concat("Hello, world ", "Let's Focus");
        return stringValue;

        // Other way to concatenate strings is using string.concat()
        // o/p => Hello, World Let's Focus
    }

    // When we send a transaction, it is "compiled" down to bytecode and sent in a "data" object of the transaction.
    // That data object now governs how future transactions will interact with it.

    // Now, in order to read and understand these bytes, you need a special reader.
    // This is supposed to be a new contract? How can you tell?
    // Let's compile this contract in foundry or remix, and you'll see the the "bytecode" output - that's how it will be sent when
    // creating a contract.

    // This bytecode represents exactly the low level computer instructions to make our contract happen.
    // These low level instructions are spread out into something call opcodes.

    // An opcode is going to be 2 characters that represents some special instruction, and also optionally has an input

    // You can see a list of there here:
    // https://www.evm.codes/

    // This opcode reader is sometimes abstractly called the EVM - or the ethereum virtual machine.
    // The EVM basically represents all the instructions a computer needs to be able to read.
    // Any language that can compile down to bytecode with these opcodes is considered EVM compatible
    // Which is why so many blockchains are able to do this - you just get them to be able to understand the EVM and presto! Solidity smart contracts work on those blockchains.

    ///////////////////////////////////////////

    // let's encode a number
    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;

        // o/p => 0x0000000000000000000000000000000000000000000000000000000000000001
    }

    // let's encode a string
    function encodeString() public pure returns (bytes memory) {
        bytes memory stringInBytes = abi.encode("Sample String");
        return stringInBytes;

        // o/p => 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000d53616d706c6520537472696e6700000000000000000000000000000000000000
        // encode() will padded with many zeros
        // It takes up lot of storage
        // we can alternatively use abi.encodePacked()
    }

    //let's encode a string using abi.encodePacked()
    // This is great if you want to save space, not good for calling functions.
    // You can sort of think of it as a compressor for the massive bytes object above.
    // Using encodePacked will save lot more gas, because it uses less space
    function encodeStringUsingPacked() public pure returns (bytes memory) {
        bytes memory data = abi.encodePacked("Sample String");

        return data;

        // o/p => 0x53616d706c6520537472696e67
    }

    // abi.encodePacked() converted strings into bytes
    // we can also covert string to bytes by using bytes("string")
    // It's slightly different from above, and they have different gas costs
    function encodeStringBytes() public pure returns (bytes memory) {
        bytes memory stringInByes = bytes("Sample String");
        return stringInByes;

        // o/p => 0x53616d706c6520537472696e67
    }
}
