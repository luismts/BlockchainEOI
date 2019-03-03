pragma solidity >=0.4.19;

import "./valorationfactory.sol";
import "./productfactory.sol";

contract ValorationService is ValorationFactory, ProductFactory {

  modifier onlyOwnerOf(uint _productId) {
    require(msg.sender == productToOwner[_productId], "Owner not allowed");
    _;
  }

  function setValoration(
    address _owner, uint _productId, uint _delivery, uint _product, 
    uint _qualityprice, bytes32 _comment) internal onlyOwnerOf(_productId) {
    
    _createValoration(_owner, _delivery, _product, _qualityprice, _comment, _productId);
  }

  function setGeneralValoration(address _owner, uint _generalValoration, uint _productId) internal onlyOwnerOf(_productId) {
    
    createGeneralValoration(_owner, _generalValoration, _productId);
  }
  
}