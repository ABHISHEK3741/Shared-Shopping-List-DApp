# Shared Shopping List DApp

## Overview

The **Shared Shopping List DApp** is a decentralized application built on Ethereum that allows users to create shared shopping lists, add items to those lists, and track the items. Users can create shopping lists, invite members by their Ethereum addresses, and add items to those lists. This application interacts with a smart contract on the Ethereum blockchain and leverages Web3.js to communicate between the frontend and the blockchain.

---

## Features

- **Create Shopping Lists**: Users can create shopping lists with custom names and invite members (other Ethereum addresses) to join.
- **Add Items to Lists**: Users can add items to a specific shopping list, including the item name and quantity.
- **View Items in List**: Users can view all the items added to a shopping list, along with their status (whether they have been purchased or not).
- **Ethereum Wallet Integration**: The application connects to the user's Ethereum wallet (e.g., MetaMask) for transaction signing and account management.

---

## How It Works

The DApp interacts with the **SharedShoppingList** smart contract deployed on Ethereum. The contract enables users to:

- Create a shopping list and add members.
- Add items to the shopping list.
- Retrieve the items in a list.

The frontend is built with HTML, CSS, and JavaScript, and it uses **Web3.js** to interact with the Ethereum blockchain.

---

## Project Structure

```
/shared-shopping-list-dapp
│
├── index.html           # Main HTML file with frontend code
├── README.md            # This README file
└── contract/             # Contains the Smart Contract source code
    └── SharedShoppingList.sol  # Solidity smart contract
```

---

## Prerequisites

To run this DApp locally, you'll need:

- A Web3 wallet like [MetaMask](https://metamask.io/) to interact with Ethereum.
- A deployed **SharedShoppingList** smart contract on a testnet or mainnet (e.g., Goerli or Rinkeby testnets).
- Web3.js to interact with Ethereum.

---

## How to Run Locally

### 1. **Clone the repository**

```bash
git clone https://github.com/your-username/shared-shopping-list-dapp.git
cd shared-shopping-list-dapp
```

### 2. **Install Dependencies**

- Ensure you have **Node.js** installed on your machine.
- Install the necessary dependencies by running:

```bash
npm install
```

### 3. **Configure the Contract**

- Replace the `contractAddress` and `contractABI` in `index.html` with the address and ABI of your deployed `SharedShoppingList` contract.

```javascript
const contractAddress = "YOUR_CONTRACT_ADDRESS"; // Replace with the contract address
const contractABI = [
  /* Replace with your contract ABI */
];
```

### 4. **Open the DApp in the Browser**

- Simply open the `index.html` file in your browser. Ensure that your MetaMask (or another Web3 wallet) is connected to the correct network (e.g., Goerli, Rinkeby).

---

## Interacting with the DApp

### 1. **Connect Wallet**

- Click the **Connect Wallet** button to connect your Web3 wallet (e.g., MetaMask).

### 2. **Create Shopping List**

- Once the wallet is connected, enter the **List Name** and the **Ethereum addresses** of members (comma-separated).
- Click **Create Shopping List** to create a new shopping list on the Ethereum blockchain.

### 3. **Add Items to List**

- After creating a shopping list, you can add items by entering the **List ID**, **Item Name**, and **Quantity**.
- Click **Add Item** to submit the item to the smart contract.

### 4. **View List Items**

- To view the items in a shopping list, enter the **List ID** and click **View Items**.
- The items added to that list will be displayed, along with their quantity and whether they have been purchased.

---

## Example

1. **Creating a Shopping List:**

   - List Name: `Grocery Shopping`
   - Members: `0xAddress1, 0xAddress2, 0xAddress3`

2. **Adding Items:**

   - List ID: `0`
   - Item Name: `Milk`
   - Quantity: `2`

3. **Viewing Items:**

   - List ID: `0`
   - This will show all items in the "Grocery Shopping" list, such as `Milk (2)`.

---

## Smart Contract (Solidity)

The **SharedShoppingList** smart contract is written in Solidity and deployed on the Ethereum blockchain. It allows users to:

- Create a shopping list with members.
- Add items to the shopping list.
- Retrieve the items in the shopping list.

### Contract Functions

- **createShoppingList**: Creates a new shopping list with a name and members.
- **addItemToList**: Adds an item to an existing shopping list.
- **getListItems**: Returns all items in a shopping list.

---

## Requirements

- **MetaMask** or any Ethereum-compatible browser extension for managing accounts and signing transactions.
- **Node.js** installed for local development.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- **Web3.js**: For interacting with the Ethereum blockchain.
- **MetaMask**: For providing easy access to Ethereum accounts.
- **Solidity**: For developing the smart contract.

---
