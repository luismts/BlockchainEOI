pragma solidity ^0.5.2;

contract Contrato9{

    uint256[] listado;
    uint256 public tamaList;
    uint public out;

    function inc(uint256 _v) public {
        listado[listado.length++]=_v;
        tamaList = listado.length;
    }

    function dec() public{
        listado.length--;
        tamaList = listado.length;
    }

    function get(uint _pos) public{
        out = listado[_pos];

    }

}
