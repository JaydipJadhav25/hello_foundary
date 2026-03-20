// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Add2{

    function add(uint a , uint b) pure external returns(uint){
        uint c = a + b ;
        return c;
    }
}
