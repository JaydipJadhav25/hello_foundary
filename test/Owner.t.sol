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

    function test_modifyOWn2() external {
        vm.prank(address(2));
        console.log(" old address 2: ", ownerIns.owner());
        ownerIns.modifyOWn(address(1));
        assertEq(ownerIns.owner(), address(1));
        console.log("new owner 2: ", address(1));
    }

    function test_SuccessfulOwnershipTransfer() public {
        // 1. Get the actual current owner from the contract
        address currentOwner = ownerIns.owner();

        // 2. Prank as THAT owner
        vm.prank(currentOwner);

        // 3. This will now pass the require check
        ownerIns.modifyOWn(address(123));

        // 4. Verify the change
        assertEq(ownerIns.owner(), address(123));
    }

    function test_CannotTransferIfNotOwner() public {
        // address(2) is not the owner
        vm.prank(address(2));

        // Tell Foundry to expect the specific error message from your require statement
        vm.expectRevert("You are not Owner!");
        ownerIns.modifyOWn(address(1));
         assertEq(ownerIns.owner(), address(1));//this show failed , otherwise when fuction failed but show correct we handle excpetion error!
    }




    function test_modifyOWn_notOwner() public {
    vm.prank(address(2));   // msg.sender = address(2)
    ownerIns.modifyOWn(address(1)); 
}
}
