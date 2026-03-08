// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Owner} from "../src/Owner.sol";

contract OwnerTest is Test {
    Owner public ownerIns;

    function setUp() public {
        ownerIns = new Owner(); //owne address is our test contract address
    }

    function testOwnerAddress() public view {
        console.log("address : ", ownerIns.owner());
    }

    function test_modifyOWn() public {
        console.log(" old address : ", ownerIns.owner());
        ownerIns.modifyOWn(address(1));
        assertEq(ownerIns.owner(), address(1));
        console.log("new owner : ", address(1));
    }


      function test_modifyOWn2() public {
        console.log(" old address 2: ", ownerIns.owner());
        ownerIns.modifyOWn(address(1));
        assertEq(ownerIns.owner(), address(1));
        console.log("new owner 2: ", address(1));
    }
}
