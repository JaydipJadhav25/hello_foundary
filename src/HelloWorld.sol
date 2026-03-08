// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract HelloWorld{
    string public  str = "hello world";


    function  div(uint a, uint b) public pure returns(uint){
        return (a/b);
    }
    
}