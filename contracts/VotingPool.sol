//SPDX-License-Identifier: minutes
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/Counters.sol';

contract VotingPool is ReentrancyGuard{
    using Counters for Counters.Counter;
    Counters.Counter private _governorId;
    
    struct Governor {
        uint governorId;
        address nftContract;
    }

    mapping(uint256 => Governor) private idsToGovernors;

    function CreateGovernor(
        address 
    )
}