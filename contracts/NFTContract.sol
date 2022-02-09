 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract NFTContract is ERC721 {
  
   string public nftTokenURI;
   uint256 public nftId;

    
    mapping(uint256 => string) public tokenURIExists;
    mapping(uint256 => uint256) public tokenIdToValue;
    

    constructor () ERC721("Test NFT", "NFT") {
        
    }
    
   
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require( _exists(tokenId),"ERC721Metadata: URI set of nonexistent token");
        tokenURIExists[tokenId] = _tokenURI;
    }
    
      
  
    function Mint (string memory _tokenURI, uint256 _nftPrice) public returns (uint256)  {
        
        nftTokenURI = _tokenURI;
        
        nftId ++;
        
        require(!_exists(nftId));
        tokenIdToValue[nftId] = _nftPrice;
        _mint(msg.sender,nftId);
        _setTokenURI(nftId, nftTokenURI);
        
        return nftId;
        
    }
    
    function tokenPrice (uint256 _tokenID) public view returns (uint256 nftPrice) {
        require(!_exists(nftId));
        nftPrice = tokenIdToValue[_tokenID]; 
    } 
    

}
