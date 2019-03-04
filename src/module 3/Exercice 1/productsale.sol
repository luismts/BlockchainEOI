pragma solidity >=0.4.19;

import "./producthelper.sol";

contract ProductSale is ProductHelper {

  event NewSale(uint productId, uint quantity, address _buyer);

  function sale(uint _productId, address _buyer, uint quantity) external onlyOwnerOf(_productId) {

    saleAndDecrease(_productId, quantity);
    byerProducts[_buyer].push(_productId);

    emit NewSale(_productId, quantity, _buyer);
  }
}
