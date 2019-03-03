pragma solidity 0.4.23;
contract Ejemplo2A{

   address owner;

   constructor(address _banco) public{
       owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setOwner(address _owner) public {
        owner=_owner;
    }
}
