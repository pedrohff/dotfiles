#!/usr/bin/env bash

section() {
  printf "#################### $1 ####################\n\n"
}

part() {
  printf ">>>>>>>>>> $1 <<<<<<<<<<\n\n"
}


localinstall() {
    part "Installing $1"
    sudo apt install $1 -y
}

installifnotexists() {
    if ! command -v $1 &> /dev/null; then
        localinstall $1
    else 
        part "Package already installed: $1"
    fi
}

jq-install(){
    if ! command -v jq &> /dev/null; then
        sudo echo "deb http://us.archive.ubuntu.com/ubuntu vivid main universe" > /etc/apt/sources.list
        localinstall jq
    fi
}

vim-install(){
    if ! command -v vim &> /dev/null; then
	localinstall vim
	part "Installing pathogen"
	mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
}
