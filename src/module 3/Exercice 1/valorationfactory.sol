pragma solidity >=0.4.19;

import "./ownable.sol";

contract ValorationFactory is Ownable {

  event NewValoration(uint valorationId, uint delivery, uint productId, uint product, uint qualityprice, bytes32 comment);

  struct Valoration {
    uint id;
    uint delivery;
    uint productId;
    uint product;
    uint qualityprice;
    bytes32 comment;
  }

  Valoration[] public valorations;

  mapping (uint => address) public valorationToOwner;
  mapping (address => uint) ownerValorationCount;

  function _createValoration(address owner, uint delivery, uint productId, uint product, uint qualityprice, bytes32 comment) internal {
   
    uint valorationId = valorations.length + 1;
    uint id = valorations.push(Valoration(valorationId, delivery, productId, product, qualityprice, comment)) - 1;

    valorationToOwner[id] = owner;
    ownerValorationCount[owner]++;

    emit NewValoration(id, delivery, productId, product, qualityprice, comment);
  }

  function createGeneralValoration(address _owner, uint _generalValoration, uint productId) public {
    require(ownerValorationCount[msg.sender] == 0, "Valoration not found");    
    _createValoration(_owner, _generalValoration, productId, _generalValoration, _generalValoration, "No comments");
  }

}