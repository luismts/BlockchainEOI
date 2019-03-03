pragma solidity ^0.5.2;

contract D {
     uint x;
     constructor(uint a) payable public { x = a; }
}

contract C {
       D d = new D(4);

       function createD(uint arg) public { D newD = new D(arg); }
       function createAndEndowD(uint arg, uint amount) public {
         // Envía un número de Ether con la creación
              D newD = (new D).value(amount)(arg);
        }
}
