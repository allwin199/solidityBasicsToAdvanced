// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Functions {
    uint256 public favouriteNumber;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieveFavouriteNumber() public view returns(uint256){
        return favouriteNumber;
    }

    function returnFive() public pure returns(uint256){
        return 5;
    }
}


// public: visible externally and internally (creates a getter function for storage/state variables)

// private: only visible in the current contract

// external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)

// internal: only visible internally
// If visibility is not mentioned explicitly "internal" will be assigned.


// Modifiers

// pure for functions: Disallows modification or access of state.

// view for functions: Disallows modification of state.

// When using the "view" function we don't spend gas because we are not modifying the state of the blockchain.
// If the "view" function is called within a function that modifies the state of the blockchain gas will be calculated for this view fn.

// payable for functions: Allows them to receive Ether together with a call.

// constant for state variables: Disallows assignment (except initialisation), does not occupy storage slot.

// immutable for state variables: Allows exactly one assignment at construction time and is constant afterwards. Is stored in code.

// anonymous for events: Does not store event signature as topic.

// indexed for event parameters: Stores the parameter as topic.

// virtual for functions and modifiers: Allows the function’s or modifier’s behavior to be changed in derived contracts.

// override: States that this function, modifier or public state variable changes the behavior of a function or modifier in a base contract.
