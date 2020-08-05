pragma solidity ^0.6.0;

interface FintMex {
    function createTokens(address to, uint256 value) external;
}

contract FintMexRep {
    
    event ScoreAdded(uint256 value, uint256 time, uint256 quality, address user);
    
    struct Score {
        uint256 value;
        uint256 time;
        uint256 quality;
    }
    
    mapping(address => Score[]) public scoreBoard;
    
    FintMex tokenAddress;
    
    constructor(FintMex add) public {
        tokenAddress = add;
    }
    
    function setScore(uint256 value, uint256 time, uint256 quality, address user) public {
        Score memory temp;
        temp.value = value;
        temp.time = time;
        temp.quality = quality;
        scoreBoard[user].push(temp);
        
        // horas * $
        uint256 tokensToSend = time * value;
        
        tokenAddress.createTokens(user, tokensToSend);
        
        emit ScoreAdded(value, time, quality, user);
        
    }
    
}