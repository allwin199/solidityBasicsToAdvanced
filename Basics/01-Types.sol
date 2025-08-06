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
    bytes8 favouriteBytes = "cat";
    // strings are secretly bytes object but only for text.
    // cat will be automatically converted into some bytes object 0x12345asas
}



