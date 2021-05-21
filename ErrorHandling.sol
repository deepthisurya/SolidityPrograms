
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Check whether the given person cab vote
 * @dev Error Handling using require function
 */
contract Bank{
    uint private value;
    address private owner;
    
    modifier isOwner(){
        require(owner == msg.sender,'Caller is not the owner!');
        _;
    }
    
    constructor(uint initialValue){
        value=initialValue;
        owner=msg.sender;
    }
    
    function addFunds(uint amount)public isOwner{
        value+=amount;
    }
    function withdrawFunds(uint amount) public isOwner{
        require(value>0 && amount<value,'Not enough Funds');
        value-=amount;
    }
    function getBalance()public view isOwner returns(uint) {
        return value;
    }
}
 
 contract Person is Bank(20){
     string private name;
     uint  private age;

     
     function setName(string memory newName) public {
         name = newName;
     }
     
     function getName() public view returns(string memory){
         return name;
     }
     
     function setAge(uint newAge) public{
         age = newAge;
     }
     
     function getAge() public view returns(uint){
         return age;
     }
     
     function canVotecheck() public view {
        require(age>=18,'The Person cannont vote yet!');
     }
 }
