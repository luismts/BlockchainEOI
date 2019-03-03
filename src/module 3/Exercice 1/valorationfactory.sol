pragma solidity >=0.4.19;

import "./ownable.sol";

contract ValorationFactory is Ownable {

  event NewValoration(uint valorationId, uint delivery, uint product, uint qualityprice, bytes32 comment);

  struct Valoration {
    uint id;
    uint delivery;
    uint product;
    uint qualityprice;
    bytes32 comment;
  }

  Valoration[] public valorations;
  uint nonce = 0;

  mapping (uint => address) public valorationToProduct;
  mapping (address => uint) ownerValorationCount;

  function _createValoration(uint delivery, uint product, uint qualityprice, bytes32 comment) internal {
   
    uint valorationId = valorations.length + 1;
    uint id = valorations.push(Valoration(valorationId, delivery, product, qualityprice, comment)) - 1;

    valorationToProduct[id] = msg.sender;
    ownerValorationCount[msg.sender]++;

    emit NewValoration(id, delivery, product, qualityprice, comment);
  }

  function createGeneralValoration(uint _generalValoration) public {
    require(ownerValorationCount[msg.sender] == 0, "Valoration not found");    
    _createValoration(_generalValoration, _generalValoration, _generalValoration, "No comments");
  }

}