pragma solidity >=0.4.19;

import "./ownable.sol";

contract ValorationFactory is Ownable {

  event NewValoration(uint valorationId, uint delivery, uint product, uint qualityprice, string comment);

  struct Valoration {
    uint id;
    uint delivery;
    uint product;
    uint qualityprice;
    string comment;
  }

  Valoration[] public valorations;

  mapping (uint => address[]) public valorationOwners;
  mapping (address => uint) ownerValorationCount;
  mapping (uint => uint[]) productValorations;

  function _createValoration(address owner, uint delivery, uint product, uint qualityprice, string memory comment, uint productId) internal {
   
    uint valorationId = valorations.length + 1;
    uint id = valorations.push(Valoration(valorationId, delivery, product, qualityprice, comment)) - 1;

    valorationOwners[id].push(owner);
    ownerValorationCount[owner]++;
    productValorations[id].push(productId);

    emit NewValoration(id, delivery, product, qualityprice, comment);
  }

  function createGeneralValoration(address _owner, uint _generalValoration, uint productId) public {
    require(ownerValorationCount[msg.sender] == 0, "Valoration not found");    
    _createValoration(_owner, _generalValoration, _generalValoration, _generalValoration, "No comments", productId);
  }

}