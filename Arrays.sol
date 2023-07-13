// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// contract is basically similar to Class in JS
contract SimpleStorage {
    uint256 myFavouriteNumber;

    // uint256[] listOfFavouriteNumbers;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    function addPerson(string memory _name,uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
    }

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }


    function showFavouriteNumber() public view returns(uint256){
        return myFavouriteNumber;
    }

    // If we have a array like
    uint256[] listOfFavouriteNumbers;

    // To rest this array,
    uint256[] listOfFavouriteNumbers = new uint256[](0)
    // creates a new dynamic array of type uint256[] with an initial length of 0
   
}
