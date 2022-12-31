// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract airdrop{
    constructor() {}

    function bulkAirdrop(ERC721 _token,address[] calldata to,uint[] calldata id) public{
        require(to.length==id.length,"Plz enter the amount");
        for(uint i=0;i<to.length;i++){
            _token.safeTransferFrom(msg.sender,to[i],id[i]);
        }
    }

    function bulkAirdrop1155(ERC1155 _token,address[] calldata to,uint[] calldata id,uint[] calldata amount) public{
        require(to.length==id.length,"Plz enter the amount");
        require(to.length==amount.length,"Amount not match");
        for(uint i=0;i<to.length;i++){
            _token.safeTransferFrom(msg.sender,to[i],id[i],amount[i],"");
        }
    }

    function bulkAirdrop20(ERC20 _token,address[] calldata to,uint[] calldata amount) public{
        require(to.length==amount.length,"Plz enter the amount");
        for(uint i=0;i<to.length;i++){
            _token.transferFrom(msg.sender,to[i],amount[i]);
        }
    }
    
}