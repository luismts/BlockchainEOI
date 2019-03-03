pragma solidity ^0.5.2;


contract Ejemplo4 {

    address  owner;
    string public txt;

    constructor() public {
	owner = msg.sender;
    }

    function sendTxt(string memory _texto) public {
        txt = _texto;
    }

    function killMe() public {
	    selfdestruct(msg.sender);
    }

}
