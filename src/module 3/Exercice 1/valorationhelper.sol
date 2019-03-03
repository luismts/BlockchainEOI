pragma solidity >=0.4.19;

import "./valorationservice.sol";

contract ValorationHelper is ValorationService {

  uint valorationUpFee = 0.001 ether;

  function withdraw() external onlyOwner {
    owner.transfer(address(this).balance);
  }

  function setValorationUpFee(uint _fee) external onlyOwner {
    valorationUpFee = _fee;
  }

  function changeGeneralValoration(uint _valorationId, uint _newValoration, bytes32 comment) external onlyOwnerOf(_valorationId) {
    valorations[_valorationId].delivery = _newValoration;
    valorations[_valorationId].product = _newValoration;
    valorations[_valorationId].qualityprice = _newValoration;
    valorations[_valorationId].comment = comment;
  }

  function getvalorationsByOwner(address _owner) external view returns(uint[] memory) {
    uint[] memory result = new uint[](ownerValorationCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < valorations.length; i++) {
      if (valorationToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}