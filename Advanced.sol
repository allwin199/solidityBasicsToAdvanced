// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Advanced {
    function combineStrings() public pure returns(string memory){
        return string(abi.encodePacked("Hi! ", "See you soon:)"));
    }

    // abi.encodePacked will encode given arg into it bytes form and then return that bytes object
    // then we are typecasting into string

    function concatStrings() public pure returns(string memory){
        return string.concat("Hi! ", "See you soon:)");
    }

    function encodeNumber() public pure returns(bytes memory) {
        bytes memory number = abi.encode(22);
        return number;
    }

    function encodeNumberPacked() public pure returns(bytes memory) {
        bytes memory number = abi.encodePacked(abi.encode(22));
        return number;
    }

    function encodeString() public pure returns(bytes memory) {
        bytes memory number = abi.encode("some string");
        return number;
    }

    function encodeStringPacked() public pure returns(bytes memory) {
        bytes memory number = abi.encodePacked("some string");
        return number;
    }

    function encodeStringBytes() public pure returns(bytes memory) {
        bytes memory number = bytes("some string");
        return number;
    }

    function decodeString() public pure returns (string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns(bytes memory){
        bytes memory someBytes = abi.encode("some string", "some other string");
        return someBytes;
    }

    function multiDecode() public pure returns(string memory, string memory){
        (string memory someString, string memory someOtherString) = abi.decode(multiEncode(), (string, string));
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns(bytes memory){
        bytes memory someBytes = abi.encodePacked("some string as encode packed ", "some other string");
        return someBytes;
    }

    // this will not work because abi can't decode packed stuff
    function multiDecodePacked() public pure returns(string memory, string memory){
        (string memory someString, string memory someOtherString) = abi.decode(multiEncodePacked(), (string, string));
        return (someString, someOtherString);
    }

    function multiStringCastPacked() public pure returns(string memory){
        string memory someString = string(multiEncodePacked());
        return someString;
    }
    // since abi.encodePacked same as string.concat
    // we can decode encodePacked using string typecast
}
