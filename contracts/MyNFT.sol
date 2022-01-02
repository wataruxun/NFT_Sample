pragma solidity 0.8.11;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    event IssueToken(uint256 tokenId, string tokenName);

    mapping(uint256 => string) public tokenName;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    function createToken(uint256 tokenId, string memory name) external {
        _safeMint(msg.sender, tokenId);
        tokenName[tokenId] = name;
        emit IssueToken(tokenId, name);
    }

    function getTokenName(uint256 tokenId) external view returns (string memory) {
        return tokenName[tokenId];
    }
}
