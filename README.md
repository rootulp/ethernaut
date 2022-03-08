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

```sh
forge build
forge test
```

## Contribute

I'd appreciate any feedback via [issues](https://github.com/rootulp/exercism/issues/new).

## License

[MIT](https://rootulp.mit-license.org/) © [Rootul Patel](https://rootulp.com)

## Solutions

| Level              | Contract                                   | Solution                                                           |
| ------------------ | ------------------------------------------ | ------------------------------------------------------------------ |
| 0. Hello Ethernaut | 0x8A18f61202Bb364e6277B42669C123E32D5e2D2d | 0xe6351327acfbc8f8063711d13c9a066e1a135fb40ce1de2dda135fc9485fe3b7 |

### 0. Hello Ethernaut

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
