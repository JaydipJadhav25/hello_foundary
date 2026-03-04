# Foundry Solidity Project

This project demonstrates how to deploy and interact with a Solidity smart contract using **Foundry**, **Anvil**, and **Cast**.

---

# Prerequisites

Install Foundry:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Check installation:

```bash
forge --version
cast --version
anvil --version
```

---

# Project Setup

Clone the repository:

```bash
git clone <your-repo-url>
cd hello_foundry
```

Build the project:

```bash
forge build
```

---

# Start Local Blockchain

Run **Anvil** (local Ethereum node):

```bash
anvil
```

Default RPC URL:

```
http://127.0.0.1:8545
```

Anvil will generate test accounts and private keys.

Example:

```
Account: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Private Key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478...
```

---

# Deploy Smart Contract

Deploy the `Counter` contract using Forge:

```bash
forge create Counter \
--rpc-url http://127.0.0.1:8545 \
--interactive \
--broadcast
```

You will be asked to enter the private key.

Example output:

```
Deployer: 0x70997970C51812dc3A010C7d01b50e0d17dc79C8
Deployed to: 0x8464135c8F25Da09e49BC8782676a84730C318bC
Transaction hash: 0x0aef8e8e57e80ed902602985bf7e9e78e4ccdac67cdb7ef01eeec537ac4f673a
```

Save the **Deployed contract address**.

---

# Read Contract Data

Call a view function:

```bash
cast call <CONTRACT_ADDRESS> "number()" \
--rpc-url http://127.0.0.1:8545
```

Example:

```bash
cast call 0x8464135c8F25Da09e49BC8782676a84730C318bC "number()" \
--rpc-url http://127.0.0.1:8545
```

---

# Write to Contract

Send a transaction to modify state:

```bash
cast send <CONTRACT_ADDRESS> "setNumber(uint256)" 100 \
--rpc-url http://127.0.0.1:8545 \
--private-key <PRIVATE_KEY>
```

Example:

```bash
cast send 0x8464135c8F25Da09e49BC8782676a84730C318bC "setNumber(uint256)" 100 \
--rpc-url http://127.0.0.1:8545 \
--private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478...
```

---

# Verify Updated Value

```bash
cast call <CONTRACT_ADDRESS> "number()" \
--rpc-url http://127.0.0.1:8545
```

Expected result:

```
0x64
```

`0x64` = **100**

---

# Check Contract Bytecode

Verify if contract exists on chain:

```bash
cast code <CONTRACT_ADDRESS> \
--rpc-url http://127.0.0.1:8545
```

If result is `0x`, contract is not deployed.

---

# Read Contract Storage

Directly inspect storage slots:

```bash
cast storage <CONTRACT_ADDRESS> 0 \
--rpc-url http://127.0.0.1:8545
```

---

# Useful Foundry Commands

Build project:

```bash
forge build
```

Run tests:

```bash
forge test
```

Format Solidity code:

```bash
forge fmt
```

Check gas usage:

```bash
forge snapshot
```

---

# Important Notes

* If **Anvil is restarted**, all deployed contracts will be removed.
* You must **deploy again** after restarting Anvil.

---

# Tech Stack

* Solidity
* Foundry
* Anvil
* Cast
* Ethereum Local Node
