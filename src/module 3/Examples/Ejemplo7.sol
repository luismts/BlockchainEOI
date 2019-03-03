pragma solidity ^0.5.2;
contract Token {

    mapping (address => uint256) public listaCuentas;


	constructor() public {
		listaCuentas[msg.sender] = 1000000;
	}


    function transfer(address _to, uint256 _value) public {
        if (listaCuentas[msg.sender]>=_value){
      		listaCuentas[msg.sender] -= _value;
    		listaCuentas[_to] += _value;
        }
	}

	function GetBalance(address  direccion) public view returns(uint256 result) {
	    result=listaCuentas[direccion];
	    return result;
	}
}
