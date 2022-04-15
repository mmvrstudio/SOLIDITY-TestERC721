# NFT Test | ERC-721 Solidity
    - Select ERC721
    - Change the name and Symbol
    - Edit Base URI (for your own tokens)

Code Sections:
      - 1. Property Variables
      - 2. Lifecycle Methods
      - 3. Pauseable Functions
      - 4. Minting Functions

### Required Modifications
    - Remove `onlyOwner` modifier from `safeMint`
    - Add in `MINT_PRICE` in ether. 
    - Add corresponding `require` statement in `safeMint()
    - Add `MAX_SUPPLY` for total number of tokens. 
    - Add corresponding `require` statement in `safeMint()`
    - In the constructor, call `_tokenIdCounter.increment()` to start the token at 1
    - Add in `withdraw()` function

## 3. Deployment Instructions:
    - Check compiler version at the type of the Solidity File:
       ex: `pragma solidity ^0.8.4;`
     - Select the compiler from the left hand side of the page and select the corresponding compiler version - 0.8.4 or whatever the newest version is out.
    - Compile the contract
    - Select the `Deploy & Run Transactions` tab.
      Environment: JavaScript VM
      Account: Make note of what account you deploy it on
      Contract: Select `YourContract.sol` from the bottom of the dropdown list.
    - View the deployed contract and examine transactions.
