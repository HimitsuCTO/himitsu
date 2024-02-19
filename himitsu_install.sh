#!/bin/bash

#This will install the himitsu binary, but should not be used for syncing a node. You can do that with runningthe bootstrap-node.sh file. 
sudo apt update -y
sudo apt install build-essential -y
sudo apt install gcc -y
sudo apt install wget -y
sudo apt install curl -y

#On Linux
sudo wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz

#unpack it
sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz


export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/go/bin

source ~/.bashrc
go env
#should output golang 1.19

curl https://get.ignite.com/cli@v0.26.1 | bash

sudo mv ignite /usr/local/bin
ignite version




git clone https://github.com/mondainai247/himitsu.git

cd himitsu
make install 

himitsud --vesion
echo “Welome to Himitsu” 
