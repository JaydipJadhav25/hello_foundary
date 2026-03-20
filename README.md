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






# 🧪 Smart Contract Testing Guide (Foundry)

This document covers all major testing techniques used in Solidity smart contracts with Foundry, including unit testing, fuzz testing, invariant testing, differential testing, assertions, cheatcodes, and best practices.

---

## 🔢 Solidity Data Types (`uint`)

`uint` (alias for `uint256`) is an unsigned integer type used to store non-negative values.

### Key Points:

* Range: `0` to `2^256 - 1`
* Cannot store negative values
* Default integer type in Solidity
* Overflow/underflow protection in Solidity ≥ 0.8

### Example:

```solidity
uint public totalSupply = 1000;

function increment() public {
    totalSupply += 1;
}
```

---

## 🧪 Unit Testing

Unit testing verifies individual functions using predefined inputs.

### Characteristics:

* Functions are explicitly called
* Full control over execution flow
* Deterministic behavior

### Example:

```solidity
function test_Increment() public {
    counter.increment();
    assertEq(counter.count(), 1);
}
```

---

## 🎲 Fuzz Testing

Fuzz testing uses randomly generated inputs to test contract behavior.

### Characteristics:

* Random inputs provided by Foundry
* Test runs multiple times
* Helps discover edge cases

### Example:

```solidity
function testFuzz_Add(uint256 x, uint256 y) public {
    uint256 result = x + y;
    assertEq(result, x + y);
}
```

---

## 🔁 Invariant Testing

Invariant testing ensures that specific conditions always remain true regardless of function calls.

### Characteristics:

* Foundry calls functions randomly
* Checks invariant after each sequence
* Validates system-level rules

### Example:

```solidity
function invariant_totalSupply_never_zero() public view {
    assert(totalSupply > 0);
}
```

### Setup:

```solidity
function setUp() public {
    target = new Token();
    targetContract(address(target));
}
```

---

## ⚖️ Differential Testing

Differential testing compares two implementations of the same logic.

### Characteristics:

* Ensures both implementations behave identically
* Useful for upgrades and optimizations

### Example:

```solidity
function test_diff(uint256 x) public {
    uint256 result1 = contractA.compute(x);
    uint256 result2 = contractB.compute(x);

    assertEq(result1, result2);
}
```

---

## 🧰 Assertions

Assertions verify expected outcomes in tests.

### Common Assertions:

```solidity
assertEq(a, b);
assertTrue(condition);
assertGt(a, b);
assertLt(a, b);
```

---

## 🧙 Cheatcodes (`vm`)

Cheatcodes allow manipulation of blockchain state during testing.

### Give ETH:

```solidity
vm.deal(address(user), 1 ether);
```

### Change Sender:

```solidity
vm.prank(user);
```

### Multiple Calls as Same Sender:

```solidity
vm.startPrank(user);
vm.stopPrank();
```

### Change Time:

```solidity
vm.warp(block.timestamp + 1 days);
```

### Expect Revert:

```solidity
vm.expectRevert();
contract.failFunction();
```

---

## 🏗️ Test Setup

Basic test contract structure:

```solidity
contract MyTest is Test {
    MyContract public target;

    function setUp() public {
        target = new MyContract();
    }
}
```

---

## 🔄 Handler Pattern (Invariant Testing)

Used to control function calls during invariant testing.

### Example:

```solidity
contract Handler {
    MyContract target;

    constructor(MyContract _target) {
        target = _target;
    }

    function callDeposit(uint256 amount) public {
        target.deposit(amount);
    }
}
```

---

## ⚡ Foundry Commands

```bash
forge test
forge test -vv
forge test --match-test testName
forge test --match-test invariant
```

---

## 🚀 Best Practices

* Test both success and failure cases
* Use fuzz testing for edge cases
* Use invariant testing for protocol safety
* Use differential testing for upgrades
* Prefer `vm.deal` over `.call` for funding
* Keep tests isolated and deterministic
* Add `receive()` when testing ETH transfers

---

## 🧠 Summary

| Type                 | Purpose                  |
| -------------------- | ------------------------ |
| Unit Testing         | Test specific functions  |
| Fuzz Testing         | Test with random inputs  |
| Invariant Testing    | Ensure rules always hold |
| Differential Testing | Compare implementations  |

---

⭐ Strong testing ensures secure, reliable, and production-ready smart contracts.

