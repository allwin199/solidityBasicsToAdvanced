// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// contract is similar to Class in JS
contract SimpleStorage {
    // myFavouriteNumber is initialized to 0.
    uint256 myFavouriteNumber;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    function addPerson(string memory _name,uint256 _favouriteNumber) public {
        listOfPeople.push(Person({favouriteNumber: _favouriteNumber, name: _name}));
    }

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }


    function showFavouriteNumber() public view returns(uint256){
        return myFavouriteNumber;
    }
 
}

// Storages in Solidity
// 1. storage
// 2. memory
// 3. calldata

// storage: Storage is the persistent storage area where state variables are stored. 
// It refers to the contract's storage, which is permanently written to the blockchain. 
// Storage variables are accessible across multiple function calls 
// and persist even after the function execution ends.

// In the above example "myFavouriteNumber" is stored in storage

// memory: Memory is a temporary storage area used for local variables and function parameters. 
// Variables stored in memory are only available during the execution of a function 
// and are cleared once the function returns.

// in the example inside the addPerson function _name is stored in memory
// it will only exists during the execution of the function and it will be cleared after the function returns
// whatever local variable we create inside the fn will be stored in memory.

// calldata is almost same as memory but one main difference is
// if we said calldata _name, we cannot change the varibale,
// for eg if we want add "!" for each name, this cannot be done in calldata
// because it is read only
// but if you mention it as memory, then we are allowed to modify it.
