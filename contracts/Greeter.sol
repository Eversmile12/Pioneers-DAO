// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract HubbleToken is ERC20Snapshot, Ownable {
    uint256 MAX_SUPPLY = 48* 10^18;
    uint256 CURRENT_SUPPLY = 0;
    constructor() ERC20("Hubble", "HUB") {}
    
    modifier isCapped(uint256 amount){
        require(CURRENT_SUPPLY + amount < MAX_SUPPLY);
        _;
    }
    
    function IssueTokens(uint256 amount, address recipient) onlyOwner isCapped(amount) public{
        _mint(recipient, amount);
    }
    
    
}