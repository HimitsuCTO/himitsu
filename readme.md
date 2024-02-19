# Himitsu Testnet is Live
**himitsu** is a decentrailized blockchain network, built to help support privacy-preserving blockchain applications, it was built using Cosmos SDK and Tendermint and created with [Ignite CLI](https://ignite.com/cli) Version v0.26.1

### Bootstrap a Himitsu Blockchain Node  
The following steps with build the chain binary, initialize a node, and sync your node to the Himitsu Blockchain Testnet. 

```
# Step 1 Clone the Repository

git clone https://github.com/Himitsu-Software/himitsu
cd himitsu

# Make the script executable if it's not already

chmod +x bootstrap-node.sh

# Run the script
./bootstrap-node.sh
```

### Ignite Install (Optional)
```
curl https://get.ignite.com/cli@v0.26.1 | bash
```
### Install The Himitsu Blockchain Binary
To install the latest version

```
git clone https://github.com/Himitsu-Software/himitsu
```
Move into the himitsu directory
```
cd himitsu
```
Install using the Makefile
```
make install 
```
See the available commands with the --help flag
```
himitsud --help
```
Connect the application to the testnet
```
himitsud config node http://172.233.157.235:26657
```
Create an account/wallets(keys) -- keep the mnemonic is safe place(though this is only testnet!) 
```
himitsud keys add account1
```
Confirm your account was created
```
himitsud keys list 

or 

himitsud keys show account1
```

Himitsu Network: A Scalable, Privacy-Preserving, and Secure Blockchain 
Network

Whitepaper Abstract:
Himitsu is made up of two key elements:

1)  The Himitsu Blockchain Network, a proof-of-stake blockchain built on 
the Cosmos SDK framework, aiming to provide scalability, privacy, and 
security in decentralized systems. Leveraging the widely adopted Cosmos 
SDK, which is used by major cryptocurrency networks such as Binance Coin, 
Cosmos Atom, and Crypto.com's native token CRO. Additionally, Himitsu Network facilitates the 
transfer of Himitsu vouchers and Content Identification Locators (CIDs) 
such as URLs, Google Drive links, BitTorrent hashes, and IPFS CIDs. 

2) The Himitsu Native App
Develoepd using Python as a crude example of the Himitsu Networks functionality. The App Contains:
- A QR Code generator to add verfied friends(tomodachi's).
- A Block Explorer
- A Wallet
- IPFS / Himitsu Network Messaging Application with Full peer-to-peer encryption. 

How it works?
Alice writes Bob a love letter using the Himitsu Native App. When she presses "send" the message is 
encrypted using a shared passcode only she and Bob have. The encrypted file is uploaded to IPFS(IPFS Daemon required). 
IPFS generates a unique CID Hash which is then written to the Himitsu Blockchain Network. Bob receives a notification 
of a new transaction from Alice. Using the CID and their shared password, Bob downloads and decrypts the love letter 
from Alice. Since Alice and Bob, must be verfied friends before messaging, this emiliminates spam. 

Current Versions(Desktop Only - Mobile Comings soon). 
Windows, Mac, Linux


## Learn more

- [Ignite CLI](https://ignite.com/cli)
- [Tutorials](https://docs.ignite.com/guide)
- [Ignite CLI docs](https://docs.ignite.com)
- [Cosmos SDK docs](https://docs.cosmos.network)
- [Developer Chat](https://discord.gg/ignite)

