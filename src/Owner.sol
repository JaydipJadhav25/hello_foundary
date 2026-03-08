// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract Owner{

    address public owner;


    constructor(){
        owner = msg.sender;
    }


    function modifyOWn(address _isOwner) external{
       require( msg.sender == owner  , "You are not Owner!");
       owner = _isOwner;
    }
}