pragma solidity >=0.4.19;

import "./producthelper.sol";

contract ProductSale is ProductHelper {

  function sale(uint _productId, uint _targetId, uint quantity) external onlyOwnerOf(_productId) {
    Product storage byerProduct = products[_targetId];
    
    saleAndDecrease(_productId, quantity);
    byerProduct.stock = byerProduct.stock + quantity;
  }
}
