# Test Token Smart Contract

This repository contains a basic Clarity smart contract for a token named "Test Token" with the symbol "TK" and a total supply of 1 billion tokens.

## Contract Structure

- **Name**: Test Token
- **Symbol**: TK
- **Decimals**: 8
- **Total Supply**: 1,000,000,000

## Functions

### Public Functions

- `initialize`: Initializes the token contract and assigns the total supply to the contract owner.
- `transfer`: Transfers tokens from the sender to the recipient.
- `get-balance`: Returns the balance of a specified account.

### Testing

Tests are located in the `tests/test-token-test.clar` file. These tests cover:

- Initializing the token contract and verifying the contract owner's balance.
- Transferring tokens and verifying the balances of the sender and recipient.
- Attempting to transfer more tokens than the sender's balance, which should fail.

## Project Structure

