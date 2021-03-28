#!/usr/bin/env bash

docker-install() {
    section "DOCKER START"
    if !command -v docker &> /dev/null
    then
    part "Installing docker required libs"
    sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
    if [ ! [test -f "/usr/share/keyrings/docker-archive-keyring.gpg" ] ]; then
        # Add docker GPG key
        part "Adding docker GPG keys"
        # TODO verify if already exists
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    fi
    part "Updating libs"
    sudo apt update -y &> /dev/null
    part "Installing docker"
    sudo apt install docker-ce docker-ce-cli containerd.io docker-ce-rootless-extras -y
    sudo usermod -aG docker $USER && newgrp docker
    else
    part "Docker already installed"
    fi
    section "DOCKER END"
}