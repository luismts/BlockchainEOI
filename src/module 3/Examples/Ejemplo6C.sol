pragma solidity ^0.5.2;

contract Contrato6CA{
 address public owner;
 uint256 public x = 10;
 uint256 public y = 5;
 uint256 public totalA;
 address public sender;

 constructor() public {
 owner = msg.sender;
 }

 function sumaA() public returns(uint256 result) {
   totalA = x + y;
   sender = msg.sender;
   return totalA;
 }
}


contract Contrato6CB{
 address public owner;
 uint256 public x = 20;
 uint256 public y = 6;
 uint256 public totalB;
 address public sender;
 address contratoA;

 constructor() public { owner = msg.sender; }

 function sumaB() public {
   //bool enviado=contratoA.callcode(bytes4(keccak256("sumaA()")));
    (bool success, bytes memory data)=contratoA.delegatecall(abi.encodeWithSignature("sumaA()"));
    assert(success);
}

 function setContratoA(address _dir) public{
   contratoA = _dir;
 }
}
