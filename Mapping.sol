// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavouriteNumber;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string name => uint256 favouriteNumber) public favOfPeople;
    // in mapping default value for all the keys is 0

    function addPerson(string memory _name,uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        favOfPeople[_name] = _favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }


    function showFavouriteNumber() public view returns(uint256){
        return myFavouriteNumber;
    }
 
}


