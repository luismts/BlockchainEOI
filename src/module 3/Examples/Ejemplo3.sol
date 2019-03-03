pragma solidity ^0.5.1;


contract Ejemplo3 {

    address private owner;
    string public txt;

    constructor() public {
	   owner = msg.sender;
    }


    function callrevert(string memory _texto) public payable {
	    txt = _texto;
        revert();
    }

    function call_require(string memory _texto) public payable {
	    txt = _texto;
       	require(msg.sender==owner);
    }

    function call_assert(string memory _texto) public payable {
        txt = _texto;
        assert(msg.sender==owner);
    }

    function call_without(string memory _texto) public payable {
        txt = _texto;

    }

}
