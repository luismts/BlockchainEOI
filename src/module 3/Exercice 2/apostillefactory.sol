pragma solidity >=0.4.19;

contract ApostilleFactory  {

  event NewApostille(uint apostilleId, string apostilleName, string apostilleUrl, bool isAvailable);

  struct Apostille {
    uint id;
    string name;
    string url;
    bool isAvailable; 
  }

  Apostille[] public apostilles;
  uint nonce = 0;

  mapping (uint => address) public apostilleToOwner;
  mapping (address => uint) public ownerApostilleCount;

  function _createApostille(Apostille memory _apostille) internal {
    uint id = apostilles.push(_apostille) - 1;
    apostilleToOwner[id] = msg.sender;
    ownerApostilleCount[msg.sender]++;
    emit NewApostille(_apostille.id, _apostille.name, _apostille.url, _apostille.isAvailable);
  }

  /// Generate a random number between @min and @max
  /// @param min minimum value 
  /// @param max maximum value 
  /// @return uint as a result
  function rand(uint min, uint max) public returns (uint){
    nonce++;
    return uint(keccak256(abi.encodePacked(nonce)))%(min+max)-min;
  }

  function createRandomApostille(string memory _name) public {
    
    uint id = apostilles.length + 1;
    string memory url = "Not description";
    bool isAvailable = true;
    Apostille memory newApostille = Apostille(id, _name, url, isAvailable);

    _createApostille(newApostille);
  }

}