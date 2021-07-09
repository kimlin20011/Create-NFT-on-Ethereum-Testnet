// @openzeppelin v3.2.0
pragma solidity ^0.8.0;
import "../node_modules/@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
contract veryBig is ERC721PresetMinterPauserAutoId {
    constructor() public
    ERC721PresetMinterPauserAutoId("veryBig", "VB", "https://ipfs.io/ipfs/QmVwDck8FSJ41zpWMoe4KoZMfqN1gdMcqNpiLX4R8LtBru/")  
    {}
    // This allows the minter to update the tokenURI after it's been minted.
    // To disable this, delete this function.
    function setTokenURI(uint256 tokenId, string memory tokenURI) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "web3 CLI: must have minter role to update tokenURI");
        setTokenURI(tokenId, tokenURI);
    }
}