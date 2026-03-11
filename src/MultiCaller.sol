// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract MultiCaller{
    address public lastCaller;
    uint public totalCaller;


    function recordCall()  public{
      lastCaller = msg.sender;
      totalCaller++;
    //   return totalCaller;   
    }
}