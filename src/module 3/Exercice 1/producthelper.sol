pragma solidity >=0.4.19;

import "./productstore.sol";

contract ProductHelper is ProductStore {

  uint productUpFee = 0.001 ether;

  modifier isAvailable(uint _productId) {
    require(products[_productId].isAvailable == false, "Product not available");
    _;
  }

  function withdraw() external onlyOwner {
    owner.transfer(this.balance);
  }

  function setProductUpFee(uint _fee) external onlyOwner {
    productUpFee = _fee;
  }

  function changeName(uint _productId, string _newName) external isAvailable(_productId) onlyOwnerOf(_productId) {
    products[_productId].name = _newName;
  }

  function getproductsByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerProductCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < products.length; i++) {
      if (productToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}