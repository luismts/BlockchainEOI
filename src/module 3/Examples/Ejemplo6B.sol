pragma solidity ^0.5.1;

contract ContratoA1 {

 address owner;
 string public txt;
 uint public valor;


 constructor() public{
 owner = msg.sender;
 }


 function sendInt(uint256 _val, string memory _texto) public {
 txt = _texto;
 valor = _val;
 }
}


contract ContratoB1 {

 address private owner;
 string public txt;
 address public contratoA;

 constructor() public{
 owner = msg.sender;
 }


 function sendInt(uint256 _val, string memory _texto) public {
  txt = _texto;
  (bool success, bytes memory data)=contratoA.call(abi.encodeWithSignature("sendInt(uint256,string)", _val, _texto));
  assert(success);

}

function setContratoA(address _contrato) public {
   contratoA = _contrato;
 }
}

