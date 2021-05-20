// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title FirstSolidity program
 * @dev implementing getter and setter functions for state variables
 */
 
 contract FirstContract{
     string private name;
     uint8 private age;
     
     //implementing getter and setter methods
     function setName(string memory newName) public {
         name=newName;
     }
     
     function getName() public view returns (string memory){
         return name;
     }
     
     function setAge(uint8 newAge) public {
         age=newAge;
     }
     
     function getAge() public view returns (uint8){
         return age;
     }
     
 }
