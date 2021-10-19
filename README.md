# EPICS NFTS

This project demonstrates how to deploy NFTs in the Web3 environment.

## How to deploy and use a contract?
1. Deploy the contract (check the command lines below).
2. Add your contract address to your frontend.
3. Load your ABI file to your frontend (check below).

## ABI (Application Binary Interface) File
You can find your ABI file under: `artifacts/contracts/MyEpicNFT.sol/MyEpicNFT.json`.
## Command lines:
### Compile our contracts:

```shell
npx hardhat compile
```

### List our local accounts:

```shell
npx hardhat accounts
```

### Run the blockchain locally:

```shell
npx hardhat node
```

### Deploy the contract to local blockchain:

```shell
npx hardhat run scripts/deploy.js --network localhost
```

### Deploy the contract to rinkeby blockchain:

```shell
npx hardhat run scripts/deploy.js --network rinkeby
```

Try running some of the following tasks:

```shell
npx hardhat clean
npx hardhat test
npx hardhat run scripts/run.js
npx hardhat help
```
