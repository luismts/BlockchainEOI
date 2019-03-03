pragma solidity ^0.5.1;
contract Ejemplo2C{

   address payable public owner;
   address payable public banco;

   uint amount;


   constructor(address payable _banco) payable public{
       owner = msg.sender;
       banco= _banco;
       amount=0;
    }

   function sendMoney(uint _amount) public payable returns(bool){
    require(msg.value==_amount);
	amount += _amount;
	uint auxBanco=_amount/2;
	uint auxOwner=_amount - auxBanco;
	require(_amount==(auxOwner+auxBanco));
	banco.transfer(auxBanco);
	owner.transfer(auxOwner);
	return true;
   }


}
