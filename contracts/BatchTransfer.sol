// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BatchTransfer is Ownable {

    IERC20 public token; // token contract

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function batchTransfer(address[] calldata _tokenHolders, uint256[] calldata _balances) external onlyOwner{
        /*
         check below off-chain for gas-saving
         _tokenHolders.length == _balances.length
         array & gas limit for each transaction
         whether or not tx succeeded
        */
        for(uint8 i = 0; i < _tokenHolders.length; i++) {
            token.transferFrom(msg.sender, _tokenHolders[i], _balances[i]);
        }    
    }

}