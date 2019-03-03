pragma solidity ^0.5.2;
contract Ejemplo5{

   uint256 public val_a;
   uint256 private val_b;

   function funA() private {
           val_a = val_b;
   }

    function funB(uint256 _v) public {
           val_b = _v;
           funA();
   }
}
