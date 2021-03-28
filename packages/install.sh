#!/usr/bin/env bash
source ~/.dotfiles/packages/helpers.sh
source ~/.dotfiles/packages/docker.sh
source ~/.dotfiles/packages/kubectl.sh
source ~/.dotfiles/packages/minikube.sh


part "Updating repositories"
sudo apt update -y &> /dev/null

jq-install
installifnotexists vim
installifnotexists gawk
installifnotexists curl


docker-install
kubernetes-install
minikube-install
