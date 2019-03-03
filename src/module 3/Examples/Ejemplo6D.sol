pragma solidity ^0.5.2;
contract Contrato6DA{
    address public owner;
    uint256 public x = 10;
    uint256 public y = 5;
    uint256 public total;
    address public sender;

    constructor() public {
        owner = msg.sender;
    }

    function sumaA() public returns(uint256)  {
        total = x + y;
        sender = msg.sender;
        return total;

    }
}


contract Contrato6DB{
    address public owner;
    uint256 public x = 20;
    uint256 public y = 6;
    uint256 public total;
    address public sender;
    address contratoA;

    constructor() public {
        owner = msg.sender;
        total= x+y;
    }

    function sumaB() public {
        (bool success, bytes memory data)=contratoA.call(abi.encodeWithSignature("sumaA()"));
        //contratoA.delegatecall(abi.encodeWithSignature("sumaA()"));
        total= bytesToUint(data);
    }

    function setContratoA(address _dir) public {
        contratoA = _dir;
    }

     function bytesToUint(bytes memory b) pure public returns (uint256){
        uint256 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint(uint8(b[i])*(2**(8*(b.length-(i+1)))));
        }
        return number;
    }

}
