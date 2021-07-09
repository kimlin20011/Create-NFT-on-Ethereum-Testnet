# Create NFT on Ethereum Testnet
> This implemtation is reference from [2021 快速建立 ERC721 標準智能合約並且 Mint NFT](https://yulinchou.medium.com/2021-%E5%BB%BA%E7%AB%8B-erc721-%E6%A8%99%E6%BA%96%E6%99%BA%E8%83%BD%E5%90%88%E7%B4%84-%E4%B8%A6%E6%89%93%E9%80%A0%E8%87%AA%E5%B7%B1%E7%9A%84-nft-99afaca68530)

## Set up 
* Create a empty directory
`mkdir NFT_EXAMPLE`
* install npm
`npm init`
* To use the standard ERC-721 smart contract, you can reference by [openzeppelin](https://docs.openzeppelin.com/learn/developing-smart-contracts) provide contract, therefore, please install @openzeppelin/contracts module
`npm install --save @openzeppelin/contracts`

## Deploying your NFT smart contract on Ethereum testnet
* It is recommanded to use the Ethereum smart contract IDE [Remix](https://remix.ethereum.org/)
### In order to manage your local directory, connect the remix IDE to local host
* install remix npm module globoly
`npm install -g @remix-project/remixd`
* check if installation successed
`remixd -v`
* link the remix and local directory
`remixd -s <absolute-path-to-the-shared-folder> --remix-ide https://remix.ethereum.org/`
* open remix can change the workspace to localhost and you can see check the local directory linked
![](https://i.imgur.com/Ok3o6p4.png)
* the create the `contracts` directory
* add your NFT smart contract file `<name>.sol`, take following solidity code as example
    * change the argument in `ERC721PresetMinterPauserAutoId` function
        * NFT NAME
        * Token code
        * MetaData URI (The share URI of created folder, remember to add `\` at last)
```solidity=
// @openzeppelin v3.2.0
pragma solidity ^0.8.0;
import "../node_modules/@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
contract veryBig is ERC721PresetMinterPauserAutoId {
    constructor() public
    ERC721PresetMinterPauserAutoId("veryBig", "VB", "https://ipfs.io/ipfs/QmVwDck8FSJ41zpWMoe4KoZMfqN1gdMcqNpiLX4R8LtBru/")  
    {}
    //NFT NAME, Token code, MetaData URI
    // This allows the minter to update the tokenURI after it's been minted.
    // To disable this, delete this function.
    function setTokenURI(uint256 tokenId, string memory tokenURI) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "web3 CLI: must have minter role to update tokenURI");
        setTokenURI(tokenId, tokenURI);
    }
}
```

![](https://i.imgur.com/oDFTnaU.png)

### Setting up MetaData URI
> Using IPFS storage. The reason is the we need to storage the docment in ad safety way
* Download [ipfs desktop](https://ipfs.io/#install)
* Open `ipfs desktop`, the import a new folder
![](https://i.imgur.com/Kak2Sr6.png)
* Import the image (or data) represent the NFT
* Import the metadata.json file, rename it to 0 (since the NFT token will mint in order from 0)
    * You can change the `tile`, `name`, and `imageUrl`
    * The `imageUrl` should be the share link of image in IPFS
![](https://i.imgur.com/eMAsjtl.png)


```json=
{
    "title": "Shun Metadata",
    "name": "shunan photo 0",
    "imageUrl": "https://ipfs.io/ipfs/QmPE3dpYehnRcQqcPWHH5AjgxS76ivhwAFik2KiaAUoAyF?filename=shun.jpeg",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this NFT represents"
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this NFT represents"
        },
        "uri": {
            "type": "string",
            "description": "A URI pointing to a resource"
        },
        "custom_attributes": {
            "type": "object",
            "description": "a nested json"
        }
    }
}
```

### Deploy the NFT contract

* compile 
![](https://i.imgur.com/VbrVGFH.png)
* deploy
    * you have to download MetaMask extension and create and account
        * you can get eth by [faucet](https://faucet.rinkeby.io/)
    * Choose the `Rinkeby Test Network`
    * Then deploy


![](https://i.imgur.com/rX9GhRJ.png)

![](https://i.imgur.com/mpDRKVy.png)


* Mint the NFT
    * pass your ethereum address to the mint 
    * Then send the transaction
    * you can check the result on [etherscan](https://rinkeby.etherscan.io/) 

![](https://i.imgur.com/MyMIw3T.png)

![](https://i.imgur.com/Kn3bMwD.png)

## OpenSea - The NFT Market
* Use the test net version [OpeaSea](https://testnets.opensea.io/?locale=ja)
* Then you can use MetaMask account to login
* Now you can show the NFT you create on your profile 
> The metadata and the figure is import from IPFS file you have already set!!

![](https://i.imgur.com/NKiyVvx.jpg)


###### tags: `區塊鏈物聯網研究`



