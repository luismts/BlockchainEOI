pragma solidity >=0.4.19;

import "./producthelper.sol";

contract ProductSale is ProductHelper {

  function sale(uint _productId, address _buyer, uint quantity) external onlyOwnerOf(_productId) {

    saleAndDecrease(_productId, quantity);
    byerProducts[_buyer].push(_productId);
  }
}
