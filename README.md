# mvts-smart-contract-curator

## Description

Smart contract for storing the address of the root router.

## Install Dependencies

```bash
yarn install
```

## Template .env

```text
PRIVATE_KEY=<string, required>
INFURA_KEY_GOERLI=<string, optional>
INFURA_KEY_ETH=<string, optional>
ETHERSCAN_API_KEY=<string, optional>
BSCSCAN_API_KEY=<string, optional>
POLYGONSCAN_API_KEY=<string, optional>
```

## Test contracts

```bash
yarn test
```

## Deploy contracts in testnet

Goerli - Ethereum testnet

```bash
yarn deploy:goerli
```

BSC testnet

```bash
yarn deploy:testnet
```

Mumbai - Polygon testnet

```bash
yarn deploy:mumbai
```

## Deploy contracts in mainnet

Ethereum mainnet

```bash
yarn deploy:eth
```

BSC mainnet

```bash
yarn deploy:bsc
```

Polygon mainnet

```bash
yarn deploy:polygon
```

## Verify contracts in testnet

goerli.etherscan.io

```bash
yarn verify:goerli
```

testnet.bscscan.com

```bash
yarn verify:testnet
```

mumbai.polygonscan.com

```bash
yarn verify:mumbai
```

## Verify contracts in mainnet
etherscan.io
```
yarn verify:eth
```

bscscan.com
```
yarn verify:bsc
```

polygonscan.com
```
yarn verify:polygon
```