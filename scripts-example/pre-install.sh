#!/bin/bash

# Declaring variables.
DISTRO=$(lsb_release -ds)
USERID=$(id -u)

# Sanity checking.
if [[ "${USERID}" -ne "0" ]]; then
    echo -e "\e[31;1;3mDebes ser usuario ROOT.\e[m"
    exit 1
fi

# Configuraction host apache
init(){
    apt-get update
    apt install -y gcc g++ make git wget unzip zip nginx
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    source ~/.bashrc
    nvm install v14.19.0
    nvm use v14.19.0
    node --version
}

# Web installation.
test() {
    echo -e "\e[32;1;3test app\e[m"
    git clone https://github.com/roxsross/challenge-linux-bash
    cd challenge-linux-bash 
    node server.js
    exit
}

# Calling functions.
if [ -f /etc/lsb-release ]; then
    echo -e "\e[33;1;3;5mUbuntu detected, proceeding...\e[m"
    init
    test
    
fi
