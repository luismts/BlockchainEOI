pragma solidity >=0.4.19;

import "./productfactory.sol";

contract ProductService is ProductFactory {

  modifier onlyOwnerOf(uint _productId) {
    require(msg.sender == productToOwner[_productId], "Owner not allowed");
    _;
  }

  function saleAndDecrease(uint _productId, uint quantity) internal onlyOwnerOf(_productId) {
    Product storage product = products[_productId];
    require(product.isAvailable, "Product is not available");
    require(product.stock < quantity, "No stock available");

    product.stock = product.stock - quantity;
    product.isAvailable = product.stock <= 0 ? false : true;
  }

}
