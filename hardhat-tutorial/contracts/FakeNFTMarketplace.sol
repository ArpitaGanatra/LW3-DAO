//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FakeNFTMarketplace {
    //mapping NFT ids to owner address
    mapping(uint256 => address) public tokens;

    //nft price
    uint256 nftPrice = 0.1 ether;

    //get the price of nft
    function getPrice() external view returns(uint256){
        return nftPrice;
    }

    //to see if NFT is available or not
    function available(uint256 _tokenId) external view returns(bool) {
        if(tokens[_tokenId] == address(0)){
            return true;
        }
        return false;
    }

    //purchase nft
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
    }
}