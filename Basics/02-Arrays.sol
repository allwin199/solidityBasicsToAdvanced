// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// contract is similar to Class in JS
contract SimpleStorage {
    uint256 myFavouriteNumber;

    // uint256[] listOfFavouriteNumbers;

    // we are creating a custom structure using struct
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Person newPerson = Person({favouriteNumber: 12, name: "Tom"})
    // Since we are using a custom type, before assigning we have to typecast it to Person type

    // This is an array of type "Person"
    Person[] public listOfPeople;

    // To a new item inside the array
    function addPerson(string memory _name,uint256 _favouriteNumber) public {
        listOfPeople.push(Person({favouriteNumber: _favouriteNumber, name: _name}));
    }

    // Since the Person[] is public we can access the elements using indices
    // but we cannot access using names
    // to access using name we have to use mapping

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
