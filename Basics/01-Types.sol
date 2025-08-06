//SPDX-License-Identifier: MIT

//Version of the solidity
pragma solidity 0.8.18;

//contract is similar to class in oops
contract SimpleStorage {
    // boolean
    bool hasFavouriteNumber = true;

    // uint -> unsigned integer(only positive whole number)
    uint256 favouriteNumber = 5;
    // favouriteNumber will have max of 256 bits (1byte = 8bits)
    // 256/8 = 32

    // int -> signed integer(both positive and negative whole number)
    int256 favouriteInt = -5;
    // favouriteInt will have max of 256 bits (1byte = 8bits)
    // 256/8 = 32

    // string
    string favouriteNumberInText = "five";

    // address
    address myAddress = 0x316e011b77f3cf6196ce4e7a87779cf0B03BD986;

    // bytes
    bytes32 favouriteBytes = "cat";
    // strings are secretly bytes object but only for text.
    // cat will be automatically converted into some bytes object 0x12345asas

    // Bytes are a collection of characters written in hexadecimal representation.

    bytes1 minBytes = "I am a fixed size byte array of 1 byte";
    bytes32 maxBytes = "I am a fixed size byte array of 32 bytes";
    bytes dynamicBytes = "I am a dynamic array, so you can manipulate my size";

    // Bytes can be allocated in size (up to bytes32). However, bytes and bytes32 represent distinct data types.

    // Strings are internally represented as dynamic byte arrays (bytes type) and designed specifically for working with text. For this reason, a string can easily be converted into bytes.

    bool: The default value is false.

    // uint: The default value is 0.
    
    // int256: The default value is 0.
    
    // string: The default value is an empty string "".
    
    // address: The default value is 0x0000000000000000000000000000000000000000 (or simply address(0)).
    
    // bytes: The default value is an empty byte array "".
    
    // bytes32: The default value is 0x0000000000000000000000000000000000000000000000000000000000000000.

}



