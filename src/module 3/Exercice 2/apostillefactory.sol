pragma solidity >=0.4.19;

import "./ownable.sol";

contract ApostilleFactory is Ownable  {

  event NewApostille(uint apostilleId, string apostilleName, string apostilleUrl, bool isAvailable);

  struct Apostille {
    uint id;
    string name;
    string url;
    uint timestamp;
    string privateKey;
    bool isAvailable; 
    bytes32 hash;
  }

  Apostille[] public apostilles;
  uint nonce = 0;

  mapping (uint => address) public apostilleToOwner;
  mapping (address => uint) public ownerApostilleCount;

  /// Generate an Apostille for a file
  /// @param apostille apostille that contain the data
  function _createApostille(Apostille memory apostille) internal {
    uint id = apostilles.push(apostille) - 1;
    apostilleToOwner[id] = msg.sender;
    ownerApostilleCount[msg.sender]++;
    emit NewApostille(apostille.id, apostille.name, apostille.url, apostille.isAvailable);
  }

  /// Generate a random number between @min and @max
  /// @param min minimum value 
  /// @param max maximum value 
  /// @return uint as a result
  function rand(uint min, uint max) public returns (uint){
    nonce++;
    return uint(keccak256(abi.encodePacked(nonce)))%(min+max)-min;
  }

  /// Generate a random Apostille for a fail file
  /// @param name fail name value of a file
  function createRandomApostille(string memory name) public {
    
    uint id = apostilles.length + 1;
    string memory url = "Not url";
    bool isAvailable = true;
    uint timestamp = block.timestamp;
    string memory privateKey = "my-private-key";
    bytes32 hash = keccak256(abi.encodePacked(url, privateKey));

    Apostille memory newApostille = Apostille(id, name, url, timestamp, privateKey, isAvailable, hash);
    
    _createApostille(newApostille);
  }

}