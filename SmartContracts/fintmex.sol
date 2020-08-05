pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract FintMex is ERC20 {

    constructor () public ERC20("FintMex", "FTM") {
        _setupDecimals(0);
    }
    
    function createTokens(address to, uint256 value) public {
        _mint(to, value);
    }
}