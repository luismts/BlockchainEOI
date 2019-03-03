pragma solidity >=0.4.19;

import "./productfactory.sol";

contract ProductService is ProductFactory {

  modifier onlyOwnerOf(uint _productId) {
    require(msg.sender == productToOwner[_productId], "Owner not allowed");
    _;
  }

  function saleAndDecrease(uint _productId, uint quantity) internal onlyOwnerOf(_productId) {
    Product storage myProduct = products[_productId];
    require(myProduct.isAvailable, "Product is not available");
    require(myProduct.stock < quantity, "No stock available");

    myProduct.stock = myProduct.stock - quantity;
    myProduct.isAvailable = myProduct.stock <= 0 ? false : true;
  }

  /*function saleOnProduct(uint _productId, uint quantity) public {
    saleAndDecrease(_productId, quantity);
  }*/
}
