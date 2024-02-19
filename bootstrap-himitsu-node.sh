#!/bin/bash

# This Script is intended to be installed on a VPS either is root or you have already created a user name and have proper SSH access priveleges. 
#!/bin/bash
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
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/go/bin
source ~/.bashrc
go version
#should output golang 1.21.6


curl https://get.ignite.com/cli! | bash



#git clone repo
git clone https://github.com/HimitsuCTO/himitsu


#cd into the repo
cd himitsu

make install

#himitsud init [moniker] 
himitsud init myhimitsunode

curl http://172.233.157.235:26657/genesis | jq '.result.genesis' > ~/.himitsu/config/genesis.json

sed -i 's/minimum-gas-prices = ""/minimum-gas-prices = "0uhimitsu"/' ~/.himitsu/config/app.toml

sed -i '/\[api\]/,+3 s/enable = false/enable = true/' ~/.himitsu/config/app.toml

sed -i '/\[api\]/,+6 s/swagger = false/swagger = true/' ~/.himitsu/config/app.toml

sed -i 's/laddr = "tcp:\/\/127\.0\.0\.1:26657"/laddr = "tcp:\/\/0.0.0.0:26657"/' ~/.himitsu/config/config.toml
sed -i 's/address = "tcp:\/\/localhost:1317"/address = "tcp:\/\/0.0.0.0:56789"/' ~/.himitsu/config/app.toml
sed -i 's/^persistent_peers = .*/persistent_peers = "10369aeaabba1e88167caa6e1008b4c1a7c6a820@172.233.157.235:26656,a96598f601e4d5b8863cf0cd1a0bcf560a86d27d@194.195.122.49:26656"/' ~/.himitsu/config/config.toml

sed -i 's/^seeds = .*/seeds = "10369aeaabba1e88167caa6e1008b4c1a7c6a820@172.233.157.235:26656,a96598f601e4d5b8863cf0cd1a0bcf560a86d27d@194.195.122.49:26656"/' ~/.himitsu/config/config.toml
himitsud start 
