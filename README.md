# Ethernaut

[![License](https://img.shields.io/:license-mit-blue.svg)](https://rootulp.mit-license.org)

Solutions to [Ethernaut](https://ethernaut.openzeppelin.com) exercises.

## Getting Started

If you are new to [Ethernaut](https://ethernaut.openzeppelin.com), you can get started with [this video](https://www.youtube.com/watch?v=kZb6Qjlgybo).
If you are new to [Foundry](https://github.com/gakonst/foundry), you can get started with [foundry-book](https://onbjerg.github.io/foundry-book/).

## Credits
1. [ethernaut-x-foundry](https://github.com/ciaranmcveigh5/ethernaut-x-foundry)
1. [Ethernaut x Foundry - 0x0 Hello Ethernaut](https://eval.hashnode.dev/ethernaut-x-foundry-0x0-hello-ethernaut)

## Local Development

1. [Install foundry](https://github.com/gakonst/foundry#installation)
1. Clone this repo
1. Create an Alchemy project for Rinkeby

```bash
cp .env .env.local
vim .env.local # Populate ETH_RPC_URL with endpoint from Alchemy
source .env.local
```

### Helpful Commands

```sh
forge build
forge test
```

## Contribute

I'd appreciate any feedback via [issues](https://github.com/rootulp/exercism/issues/new).

## Solutions

Level | Name              | Contract                                   | Solution                                                           |
----- | ----------------- | ------------------------------------------ | ------------------------------------------------------------------ |
0     | Hello Ethernaut   | 0x8A18f61202Bb364e6277B42669C123E32D5e2D2d | 0xe6351327acfbc8f8063711d13c9a066e1a135fb40ce1de2dda135fc9485fe3b7 |
1     | Fallback          | 0x519AdEA92a0deE916489431c2f6473B44b570F3f | 0x706b0bf05a40a171461540f5eb96875a6f41d8a5ef79b10110cf600b43d95976 |
2     | Fallout           | 0x4D341BF4bf10D415c0Ed61293629394546ca5670 | 0xb2909f15f72e8ec92d9419a2ac44afb9335ab41a6855424e62496ee64daf91d8 |

## Notes

### Hello Ethernaut

```javascript
await contract.info(); // "You will find what you need in info1()."
await contract.info1(); // "Try info2(), but with \"hello\" as a parameter."
await contract.info2("hello"); // "The property infoNum holds the number of the next info method to call."
await contract.infoNum();
await contract.info42(); // "theMethodName is the name of the next method."
await contract.theMethodName(); // "The method name is method7123949."
await contract.method7123949(); // "If you know the password, submit it to authenticate()."
await contract.password(); // "ethernaut0"
await contract.authenticate("ethernaut0");
```

### Fallback
- `0x7109709ECfa91a80626fF3989D68f67F5b1DD12D` is a special contract address. See [cheatcodes](https://onbjerg.github.io/foundry-book/forge/cheatcodes.html).
- Used Remix to call contribute 1 wei, transact with 1 wei (triggers fallback), then withdraw
- In Remix, replace `@openzepplin` prefix with URL to repo
```solidity
// -import '@openzeppelin/contracts/math/SafeMath.sol';
// +import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/math/SafeMath.sol';
```

### Fallout
- Prefer `constructor()` over contract name constructor to avoid typos.

### CoinFlip
- Don't rely on blockhash as a source of randomness. Consider [VRF](https://docs.chain.link/docs/chainlink-vrf/) instead.
