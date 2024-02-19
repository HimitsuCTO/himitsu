#!/bin/bash

# This Script is intended to be installed on a VPS either is root or you have already created a user name and have proper SSH access priveleges. 

sudo apt update -y
sudo apt install build-essential -y
sudo apt install gcc -y
sudo apt intall git -y
sudo apt install wget -y
sudo apt install curl -y
#On Linux
sudo wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
#unpack it
sudo tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz

export GOROOT=/usr/local/go
echo "Path Updated"

export PATH=$PATH:$GOROOT/bin
echo "Path Updated"

export PATH=$PATH:~/go/bin
echo "Path Updated"

export PATH=$PATH:~/usr/local/bin
echo "Path Updated"
source ~/.bashrc

echo ".bashrc path variables updated"

go env

#should output golang 1.21.6


curl https://get.ignite.com/cli@v0.26.1 | bash
echo "Ignite CLI succesfully downloaded"
sudo mv ignite /usr/local/bin
echo "Ingite moved to /usr/local/bin"

git clone https://github.com/mondainai247/himitsu.git

cd himitsu

make install 

himitsud init my_himitsu_node

#This will need to be updated when network is upgraded to include sentry nodes. 
curl http://139.162.12.106:26657/genesis | jq '.result.genesis' > ~/.himitsu/config/genesis.json

echo "Genesis File Copied"

sed -i '/\[api\]/,+3 s/enable = false/enable = true/' ~/.himitsu/config/app.toml

sed -i 's/minimum-gas-prices = "0stake"/minimum-gas-prices = "0.0025himitsu"/' ~/.himitsu/config/app.toml

#sed -i 's/^rpc_servers = .*/rpc_servers = "your.ip.address:26657,172.233.157.106:26657"/' ~/.himitsu/config/config.toml

#sed -i 's/^seeds = .*/seeds = "70a020a009bb763c946acc63fb5df35693d011d3@172.104.165.223:26656, 6eec761b4572463dc1095119dde2ec2d2e878b73@172.233.157.106:26656"/' ~/.himitsu/config/config.toml

sed -i 's/^persistent_peers = .*/persistent_peers = "189ba9a4c3ec7b0efda45f2a2c400cc5993fa0ab@172.233.157.235:26656,36349393e3ddd277cb5cc35ea0ed09158836cd6a@194.195.122.49:26656"/' ~/.himitsu/config/config.toml

echo "Persistent Peers Updated in Config.toml"

#(Optional)Change state sync to true 
#sed -i 's/enable = true/enable = false/' ~/.himitsu/config/config.toml

#sed -i 's/timeout_precommit = "1s"/timeout_precommit = "10s"/' ~/.himitsu/config/config.toml

sed -i 's/timeout_commit = "5s"/timeout_commit = "20s"/' ~/.himitsu/config/config.toml

himitsud start
