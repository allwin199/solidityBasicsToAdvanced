// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract Decoding {
    function encodeString() public pure returns (bytes memory) {
        return abi.encode("Sample String");
    }

    function decodeString() public pure returns (string memory) {
        string memory decodedString = abi.decode(encodeString(), (string));
        // we want this to be decoded into strings. So we have to explicitly mention them

        return decodedString;
    }

    // let's multiencode and multidecode
    function multiEncodeString() public pure returns (bytes memory) {
        return abi.encode("Sample Strings", "But More");
    }

    function multiDecodeString() public pure returns (string memory, string memory) {
        return abi.decode(multiEncodeString(), (string, string));
    }

    // we can also multiEncode using abi.encodePacked()
    function multiEncodePackedString() public pure returns (bytes memory) {
        return abi.encodePacked("Sample Strings ", "But More");

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
