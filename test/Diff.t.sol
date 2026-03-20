// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Add1} from "../src/Add1.sol";
import {Add2 } from "../src/Add2.sol";


contract DiffTesting is Test{
       
       Add1 public add1;
       Add2 public add2;
  

    //create instace
    function setUp() external{
        add1 = new Add1();
        add2 = new Add2();
    }
    //call function and check result
    function testDiffAdditionsFunctions() view external {
        //call and check
        assertEq(add1.add(1, 2), add2.add(1 ,2));
    }
}
