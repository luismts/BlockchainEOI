pragma solidity ^0.5.2;

contract Evento{

event Evento( address indexed _from, uint _value);

constructor() public {
   uint val = 10;
   emit Evento(msg.sender, val);
   }
}
