pragma solidity ^0.5.2;


contract ContratoA {

    address  owner;
    string public txt;

    constructor() public {
	owner = msg.sender;
    }

    function sendTxt(string memory _texto) public {
        txt = _texto;
    }

}




contract ContratoB {

    address owner;
    string public txt;

    address public contratoA;

    constructor() public {
        owner = msg.sender;
    }

    function sendTxt(string memory _texto) public {
        ContratoA ca = ContratoA(contratoA);
        txt = _texto;
       	ca.sendTxt(_texto);
    }

    function setContratoA(address _contrato) public {
	contratoA = _contrato;
    }
}
