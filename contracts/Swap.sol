// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "./TestFT.sol";
import "./NFTContract.sol";

contract Swap {
    
    TestFT token;
    NFTContract  nFT;
     mapping(uint256 => address) public nftBuyers;
   
    constructor (address tokenAddress, address NFTAddress)  {
        token = TestFT(tokenAddress);
        nFT = NFTContract(NFTAddress);
       
    }
    function nftBuy(uint256 _tokenId) payable public {
      
       uint nftPrice = nFT.tokenPrice(_tokenId);
        require(token.allowance(msg.sender, address(this)) >= nftPrice, "Insufficient allowance.");
        require(token.balanceOf(msg.sender) >= nftPrice, "Insufficient balance.");

        token.transferFrom(msg.sender, nFT.ownerOf(_tokenId), nftPrice);
        nFT.safeTransferFrom(nFT.ownerOf(_tokenId),msg.sender,_tokenId );

         nftBuyers[_tokenId] = msg.sender;
 
    }
    
    
    
}