// contracts/VolcanoNFT.sol
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VolcanoNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address payable private _owner;

    constructor() ERC721("VolcanoNFT", "VLC") {}

    function mint(address holder, string memory tokenURI)
        payable
        public
        returns (uint256)
    {
        require(msg.value == 0.01 ether, "Minting fee of 0.01 ether");
        uint256 newItemId = _tokenIds.current();
        
        _mint(holder, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }
}