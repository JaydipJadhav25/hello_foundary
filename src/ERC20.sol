// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


// note[unaliased-plain-import]: use named imports '{A, B}' or alias 'import ".." as X'
//  --> src/ERC20.sol:4:8
//   |
// 4 | import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//   |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//   |
//   = help: https://book.getfoundry.sh/reference/forge/forge-lint#unaliased-plain-import

// jay@DESKTOP-FT8JTED:/mnt/c/CODES/foundarySolidity/hello_foundry$ 
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";




import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Jay is ERC20{
    constructor(uint256 initialSupply) ERC20("GLOD",  "GLD"){
        _mint(msg.sender , initialSupply);
    }
}



