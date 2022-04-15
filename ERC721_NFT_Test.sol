pragma solidity ^0.8.4;

contract AlienOverlord is ERC721, ERC721Enumerable, Pausable, Ownable {

    // ===== 1. 'AlienOverlord' Property Variables ===== //

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 public MINT_PRICE = 0.00033 eth;
    uint public MAX_SUPPLY = 10;

    // ===== 2. Lifecycle Methods ===== //

    constructor() ERC721("AlienOverlord", "AO") {
        // Start token ID at 1. By default is starts at 0.
        _tokenIdCounter.increment();
    }
    function withdraw() public onlyOwner() {
        require(address(this).balance > 0, "Balance is zero");
        payable(owner()).transfer(address(this).balance);
    }

    // ===== 3. 'AlienOverlord' Pauseable Functions ===== //

    function pause() public onlyOwner {
        _pause();
    }
    function unpause() public onlyOwner {
        _unpause();
    }

    // ===== 4. 'AlienOverlord' Minting Functions ===== //

    function safeMint(address to) public payable {
        // Note: Check that totalSupply is less than MAX_SUPPLY
        require(totalSupply() < MAX_SUPPLY, "Can't mint anymore tokens.");

        // Note 2: Check if ether value is correct
        require(msg.value >= MINT_PRICE, "Not enough ether sent.");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // ===== 5. Other Functions ===== //

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://alienoverlordBaseURI/";
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

/* IMPORTANT NOTES:

    contract address: 0xd9145CCE52D786f254917e481eB44e9943F39138
    mint price: 0.00033 eth

    // Users
    owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        - deployed contract
        - can only call the `onlyOwner` modifier functions

    address 2: 0xAb8484F64d9C6d1EcF9b849Ae677dD3315835cd2
        - mint 1 NFT

    address 3: 0x4B20993Bc451177ec7E8f571ceCaE8A9e22C02da
        - address 2 will transfer NFT #1 to address 3 (recipient)

*/
