// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Safe} from "../src/Safe.sol";

contract SafeTest is Test {
    Safe public insat;

    function setUp() public {
        insat = new Safe();
    }

    //to revice ethers from another addresses
    receive() external payable {}

    //this is manual testing fron 1 ethers

    // function test_withdraw() external {
    //     // send ether to Safe contract
    //     (bool ok, ) = payable(address(insat)).call{value: 1 ether}("");
    //     require(ok, "Transfer failed");

    //     // check current balance
    //     uint preBalance = address(this).balance;

    //     // withdraw from Safe to this contract
    //     insat.withdraw();

    //     // check new balance
    //     uint postBalance = address(this).balance;

    //     //  balance should increase
    //     assertEq(postBalance, preBalance + 1 ether);
    // }

    // use fuzz tesing
   //test contract have 2^96 ethers
   //so try all posiable values
    function test_fuzz_withdraw(uint96 amount) external {
        //first send main contract ethers
        (bool ok , ) = payable(address(insat)).call{value : amount}("");
        require(ok , "failed!");

        //then check balance
        uint preBalance = address(this).balance;

        //then call contract function so contract send eth
        insat.withdraw();

        //so our balance is incress agin so check agin
        uint postBalance = address(this).balance;

        //note : if main contratc send ethers so our balance agin have amounts of ethers
        assertEq(postBalance, preBalance + amount);
    }
}
