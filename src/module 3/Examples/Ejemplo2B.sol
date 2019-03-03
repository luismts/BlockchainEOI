pragma solidity ^0.5.1;
contract Ejemplo2B{

   address payable public owner;
   address payable public banco;

   uint amount;


   constructor(address payable _banco) payable public{
       owner = msg.sender;
       banco= _banco;
       amount=0;
    }

   function sendMoney(uint _amount) public payable returns(bool){
       amount = _amount;
	   banco.transfer(_amount/2);
	   owner.transfer(_amount/2);
	   return true;
   }
}
