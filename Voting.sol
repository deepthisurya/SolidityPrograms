// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import './AccessControlled.sol';

contract Voting is AccessControlled{
    

    // Vote struct . It defines a custom type to be used to store values for every vote received
    struct Vote {
        address receiver;
        uint256 timestamp;
    }
    
    //The main vote state variable for the type 'mapping'. This is like a hash map of all votes collected  from each voter
    mapping(address=> Vote) public votes;
    
    
    //Define events we wish to emit
    event AddVote(address indexed voter,address receiver,uint256 timestamp);
    event RemoveVote(address voter);
    event StartVoting(address startedBy); 
    event StopVoting(address stopedBy);
    
    function startVoting() external isVotingClosed returns(bool){
         isVoting=true;
        emit StartVoting(msg.sender);
        return true;
    }
    
    function stopVoting() external isVotingOpen returns(bool){
        isVoting=false;
        emit StopVoting(msg.sender);
        return true;
    }
    
    function addVote(address receiver) external isVotingOpen returns(bool){
        require(receiver != address(0),'You have not entered a Valid Address !'); //address(0) is all zero address which is not a valid address
        votes[msg.sender].receiver = receiver ;
        votes[msg.sender].timestamp = block.timestamp;
        emit AddVote(msg.sender,votes[msg.sender].receiver, votes[msg.sender].timestamp);
        return true;
    }
    
    function removeVote() external isVotingOpen returns(bool){
        require(votes[msg.sender].timestamp > 0,"The user has not Voted!");
        delete votes[msg.sender];
        emit RemoveVote(msg.sender);
        return true;
    }
    
    function getVote(address voterAddress) external view returns(address candidateAddress){
         return votes[voterAddress].receiver;
    }
    
}
