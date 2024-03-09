// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {CallAnything} from "./CallAnything.sol";

contract CallFunctionWithoutContract {
    CallAnything callAnything;

    constructor(address callAnythingContract) {
        callAnything = CallAnything(callAnythingContract);
    }

    // with a staticcall, we can have this be a view function!
    function staticCallFunctionDirectly() public view returns (bytes4, bool) {
        (bool success, bytes memory returnData) =
            address(callAnything).staticcall(abi.encodeWithSignature("getFunctionSelector()"));
        return (bytes4(returnData), success);
    }

    // since we have the contract address of `callAnything` contract
    // and we know which function to call `transfer`
    // we can encode the `transfer` function with `encodeWithSignature` and call directly
    // by calling this fn, we are updating storage in `callAnything` contract
    // by calling this fn, we are updating storage in callAnything contract
    function callTransferFunctionDirectly(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) =
            address(callAnything).call(abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount));
        return (bytes4(returnData), success);
    }
}
