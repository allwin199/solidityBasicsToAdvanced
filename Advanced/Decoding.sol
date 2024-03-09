// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Decoding {
    function encodeString() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("Sample String");
        return someString;
    }

    function decodeString() public pure returns (string memory) {
        string memory decodedString = abi.decode(encodeString(), (string));
        // abi.decode takes the 1st param which is the "encodedData"
        // seconds params which is the tuple() in which it takes the set of types, we want the data to be decoded
        // In this example we have encodedData which is a string and
        // we want this to be decoded into string. 

        return decodedString;
    }

    // let's multiencode and multidecode
    function multiEncodeString() public pure returns (bytes memory) {
        bytes memory stringVal = abi.encode("Sample Strings", "But More");
        return stringVal;
    }

    function multiDecodeString() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(multiEncodeString(), (string, string));
        return (someString, someOtherString);
    }

    // we can also multiEncode using abi.encodePacked()
    function multiEncodePackedString() public pure returns (bytes memory) {
        bytes memory stringVal = abi.encodePacked("Sample Strings ", "But More");
        return stringVal;

        // o/p => 0x53616d706c6520537472696e6773427574204d6f7265
    }

    // Note: Decoding dosen't work on abi.encodePacked();
    // Other way to do is, to typecast into a string
    // because packedEncoding is similar to typecasting into string

    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePackedString());
        return someString;
    }
}
