pragma solidity ^0.4.12; //Compilador

//Definición contrato
contract ejemplo1{
    //Variables de entorno	
   address owner;
   string campo_A;
   string campo_B;
   //Constructor
   function ejemplo1() {
       owner = msg.sender;
       campo_A = 'vacío';
       campo_B = 'vacío';
    }
   //Funciones 
   function SetCampoA(string campo) returns(bool){
        campo_A = campo;
        return true;
   }
   function GetCampoA() returns(string){
        return campo_A;
   }
   function GetCampoB() returns(string){
        return campo_B;
   }
 
}
