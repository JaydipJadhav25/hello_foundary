// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract RunScript is Test {
    
    function testScript() public {
        // Define the command to execute
        string[] memory command = new string[](2);
        command[0] = "node";
        command[1]="./script/fetchbloch.js";

        // Execute the command and capture the output
        bytes memory blockNumber = vm.ffi(command);
        // console.logBytes(result);
        // console.log(blockNumber);
    }
}