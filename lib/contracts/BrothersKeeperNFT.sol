//SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;


import "@openzeppelin4.8.0/contracts/token/ERC721/extensions/ERC721Votes.sol";
import "@openzeppelin4.8.0/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin4.8.0/contracts/access/Ownable.sol";
import "../interfaces/IBrothersKeeperNFT.sol";


contract BrothersKeeperNFT is 
    IBrothersKeeperNFT,
    ERC721Votes,
    Ownable 
    {
    
    event transferSent (
        address sender,
        address reciepient
    );

    uint private tokenId;
    string private _baseURIstring;
    uint256 private immutable tokenPrice;


    constructor (uint256 _tokenPrice)
        ERC721 ("BrothersKeeperNFT", "BK")
        EIP712("BrothersKeeperNFT", "1") 
    {
        tokenPrice = _tokenPrice;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseURIstring;
    }

    function setBaseUri(string calldata newUri) external onlyOwner() {
        _baseURIstring = newUri;
    }

    function mint(address reciepient) public payable {
        require(msg.value >= tokenPrice * 1 ether, "Insufficient funds to mint Token");
        _mint(reciepient, tokenId);
        tokenId += 1;
    }

    function governorMint(address destination) public onlyOwner {
        _mint(destination, tokenId);
        tokenId += 1;
    }

    function _sendCoin(address payable recipient, uint amount) private {
        (bool success, ) = recipient.call{value: amount}("");
        require (success, "Transfer Failed.");
        emit transferSent(address(0),recipient);
    }
    
    function sendCoin(address payable recipient, uint amount) external onlyOwner() {
        require(address(this).balance >= amount, "Insufficient funds");
        _sendCoin(recipient,amount);
    }

    function _sendERC20Token(address tokenAdd, address reciepient, uint amount) private {
        IERC20(tokenAdd).transfer(reciepient, amount);
        emit transferSent(tokenAdd, reciepient);
    }
    function sendERC20Token(
        address tokenAdd, address reciepient, uint amount) external onlyOwner() {
        require(IERC20(tokenAdd).balanceOf(address(this)) >= amount,
            "Insufficient Funds");
        _sendERC20Token(tokenAdd,reciepient,amount);
    }
}
