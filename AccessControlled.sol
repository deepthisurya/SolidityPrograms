// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract AccessControlled{
    bool public isVoting;
    
    constructor(){
        isVoting = false;
    }
    
    //Modifiers used as a part of the program as defined here
    modifier isVotingOpen(){
        require(isVoting == true, 'Voting process is not Open!');
        _;
    }
    
    modifier isVotingClosed(){
        require(isVoting == false, 'Voting is Open, You cant start is again!');
        _;
    }
}
