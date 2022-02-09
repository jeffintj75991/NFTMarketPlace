// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;


import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestFT is ERC20 {
    constructor() ERC20("Test FT", "TFT") {
        _mint(msg.sender, 1000 * 10 ** 18);
    }
}