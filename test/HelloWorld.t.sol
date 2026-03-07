// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test , console } from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";



contract HelloWorldTest is Test {
    //create variable like cutome type of varible is helloworld contract
    HelloWorld public  instance;

    function setUp() public {
        //create instace 
        console.log("steup....!!");
        instance = new HelloWorld(); //create instace on contract
    }

    function test_str() public view {
        console.log("test_str..");

     assertEq(instance.str(), "hello world");
    }


    function test_str2() public view {
         console.log("test_str2..");
     assertEq(instance.str(), "hello world");
    }


    function test_str3() public view {
         console.log("test_str3..");
     assertEq(instance.str(), "hello world");
    }


     function teststr4() public view {
         console.log("test_str4..");
     assertEq(instance.str(), "hello world");
    }

  
}
