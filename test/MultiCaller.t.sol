// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MultiCaller} from "../src/MultiCaller.sol";

contract MultiCallerTes is Test {
    MultiCaller public instance;

    function setUp() public {
        //create instace
        console.log("steup....!!");
        instance = new MultiCaller(); //create instace on contract
    }

    //call to funtion => recordcall
    function test_recordCall() public {
        //1
        instance.recordCall();
        console.log("last caller  1: ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());

        vm.prank(address(1));
        instance.recordCall();
         console.log("last caller 2: ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());


        //3
        instance.recordCall();
        console.log("last caller :3 ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());


                 
         //all address chnage
         vm.startPrank(address(1));

        console.log("start vm prank !...");


        //4
        instance.recordCall();
        console.log("last caller :3 ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());



        //5
        instance.recordCall();
        console.log("last caller :3 ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());



        //6
        instance.recordCall();
        console.log("last caller :3 ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());


         vm.stopPrank();
        console.log("stop vm prank !...");



           //7
        instance.recordCall();
        console.log("last caller :3 ", instance.lastCaller());
        console.log("total calles : ", instance.totalCaller());



    }
}
