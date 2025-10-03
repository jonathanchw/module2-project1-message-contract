# Message Contract
Module 2 - Project 1 | Educational Solidity smart contract for storing messages and numbers on-chain.  Includes events, modifiers, reentrancy protection, and best practices. Part of Module 2 Project 1 of the Ethereum Developer Pack.

## Project Description
This project is a simple Solidity smart contract that allows:
- Storing a message and a number on the blockchain.
- Retrieving the stored message and number.
- Storing two numbers and returning their sum.
- Emitting an event whenever the message is updated.
- Using a reentrancy guard mechanism.


## Contract Structure
- **State variables**: for messages, numbers, and addresses.
- **Events**: `MessageUpdated` to notify when a message changes.
- **Modifiers**: `onlyOwner` and `reentrancyGuard`.
- **Functions**: for setting and retrieving data, and summing numbers.

## How to Clone and Run
1. Clone the repository:
```bash
git clone https://github.com/jonathanchw/module2-project1-message-contract.git
```

2. Open the project in a Solidity-compatible IDE (Remix IDE or VS Code with the Solidity extension).

- Compile the contract using **Solidity version 0.8.26**.
- Deploy the contract to a Testnet (**Goerli, Sepolia, etc.**).
- Interact with the following functions:
  - `setMessageAndNumber`
  - `setSumNumbers`
  - `getMessage`
  - `getNumber`
  - `sum`
- View the global variable states:
  - `s_origin`
  - `s_sender`
  - `s_owner`

3. You can also view the deployed contract here:  
   [0x16f058616613a1d7eEd7C3a22d6fb0B2A38093D4](https://sepolia.etherscan.io/address/0x16f058616613a1d7eEd7C3a22d6fb0B2A38093D4#code)


