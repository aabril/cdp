# Cardano Crowdfunding Project

This project demonstrates a simple crowdfunding application on the Cardano blockchain using Aiken-lang.

## Project Structure

- `validators/`: Contains the Aiken-lang smart contract.
- `test/`: Contains test scripts for the smart contract.
- `scripts/`: Contains scripts for deploying and interacting with the smart contract.

## Usage

1. **Deploy the Smart Contract**:
    ```bash
    ./scripts/deploy_contract.sh
    ```

2. **Interact with the Smart Contract**:
    ```bash
    ./scripts/interact_contract.sh
    ```

## Smart Contract Functions

- `createProposal(proposalId: Int, deadline: Timestamp, goal: Value)`: Creates a new proposal.
- `fundProposal(proposalId: Int)`: Funds a proposal.
- `finalizeProposal(proposalId: Int)`: Finalizes a proposal and distributes funds.

## Testing

Run the tests using the Aiken-lang testing framework:
```bash
aiken test
