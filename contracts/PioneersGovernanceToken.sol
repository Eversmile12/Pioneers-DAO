//SPDX-License-Identifier: minutes

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/'

contract PioneersGovernance is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    address marketplaceContractAddress;

    struct Holder {
        uint tokenId;
        address holder;
    }

    mapping(uint => Holder) governors;

    constructor(address marketplaceAddress) ERC721("Pioneers Governance Token", "PGT"){
        marketplaceContractAddress = marketplaceAddress;
    }

    function CreateToken(string memory tokenURI) public returns(uint){
        _tokenIds.increment();

        uint256 newHolderId = _tokenIds.current();

        _mint(msg.sender, newHolderId);  
        _setTokenURI(newHolderId, tokenURI);
        
        governors[newHolderId] = Holder(newHolderId, msg.sender);

        setApprovalForAll(marketplaceContractAddress, true);
        
        return newHolderId;
    }
}
