// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import {Test, console} from "forge-std/Test.sol";
import { RequireRevert } from "../src/RequireRevert.sol";



contract RequireRevertTest is Test {

    //create instance
    RequireRevert public requireRevertInstance;


    //setup function
   
    function setUp() public {
        //create instace
        console.log("steup....!!");
        requireRevertInstance = new RequireRevert(); //create instace on contract
    }
    
    function test_setValue() public {
    vm.expectRevert("Value must be greater than 10");
    requireRevertInstance.setValue(15);
}


}
