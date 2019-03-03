pragma solidity ^0.5.2;

contract Contrato8{
    address payable public owner;


    constructor() public {
        owner = msg.sender;
    }

    modifier soloOwner {
	    require(msg.sender == owner);
	    _;
    }

    function sumaA(uint _x, uint _y) public pure returns(uint total){
        total = _x + _y;

    }

    function killMe() public soloOwner {
        selfdestruct(owner);
    }

}
