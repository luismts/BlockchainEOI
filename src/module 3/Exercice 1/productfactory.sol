pragma solidity >=0.4.19;

import "./ownable.sol";

contract ProductFactory is Ownable {

  event NewProduct(uint productId, bytes32 name, uint price, bytes32 description, bool isAvailable, uint stock);

  struct Product {
    uint id;
    bytes32 name;
    uint price;
    bytes32 description;
    bool isAvailable;
    uint stock;    
  }

  Product[] public products;
  uint nonce = 0;

  mapping (uint => address) public productToOwner;
  mapping (address => uint) ownerProductCount;
  mapping (address => uint[]) byerProducts;

  function _createProduct(Product memory _product) internal {
    uint id = products.push(_product) - 1;
    productToOwner[id] = msg.sender;
    ownerProductCount[msg.sender]++;
    emit NewProduct(_product.id, _product.name, _product.price, _product.description, _product.isAvailable, _product.stock);
  }

  /// Generate a random number between @min and @max
  /// @param min minimum value 
  /// @param max maximum value 
  /// @return uint as a result
  function rand(uint min, uint max) public returns (uint){
    nonce++;
    return uint(keccak256(abi.encodePacked(nonce)))%(min+max)-min;
  }

  function createRandomProduct(bytes32 _name) public {
    require(ownerProductCount[msg.sender] == 0, "Product not found");
    
    uint id = products.length + 1;
    uint price = rand(1, 10000);
    bytes32 description = "Not description";
    bool isAvailable = rand(0,1) == 0 ? false : true;
    uint stock = rand(0,1000);
    Product memory newProduct = Product(id, _name, price, description, isAvailable, stock);

    _createProduct(newProduct);
  }

}