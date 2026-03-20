// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Safe {
    receive() external payable {}

    function withdraw() external {
        // payable(msg.sender).transfer(address(this).balance);
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(success, "failed trasfer ether!");
    }
}
