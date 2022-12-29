// ERC-20 with simple reflection 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Kenny is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, 10 * 10 ** 18);
    }

        function transfer(address to, uint256 amount) public virtual override returns (bool) 
        {
        address owner = _msgSender();
        uint256 reflectedAmount; 
        reflectedAmount = ((amount / 100) * 98); //two percent back! woo!  
        _mint(owner, reflectedAmount); 
        _transfer(owner, to, amount);
        return true;
    }
}