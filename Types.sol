//SPDX-License-Identifier: MIT

//Version of the solidity
pragma solidity ^0.8.7;

//contract is similar to class in oops
contract SimpleStorage {
    // boolean
    bool hasFavouriteNumber = true;

    // uint
    uint256 favouriteNumber = 5;

    // int
    int256 favouriteInt = -5;

    // string
    string favouriteNumberInText = "five";

    // address
    address myAddress = 0x316e011b77f3cf6196ce4e7a87779cf0B03BD986;

    // bytes
    bytes8 favouriteBytes = "cat";
    // strings are secretly bytes object but only for text.
    // cat will be automatically converted into some bytes object 0x12345asas
}



