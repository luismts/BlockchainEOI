pragma solidity ^0.5.2;
contract Ejemplo2{

   string private campo_A;
   string private campo_B;


   constructor() public{
       campo_A= "";
       campo_B= "";
    }

   function setA(string memory _campo_A) public {
	 campo_A=_campo_A;
   }

   function setB(string memory _campo_B) public {
	 campo_B=_campo_B;
   }

   function getA() public view returns(string memory){
	 return campo_A;
   }

   function getB() public view returns(string memory){
	 return campo_B;
   }
}
