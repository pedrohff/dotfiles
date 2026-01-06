#!/usr/bin/env bash

alias gcm="git commit -m"
alias gco="git checkout"
alias gm="git merge"
alias gd="git diff HEAD"
alias gr="git rebase"
alias gs="git status"
alias ga="git add"
alias gp="git push"
gps() {
    branchName=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branchName
}
gcom() {
    git fetch --all
    git checkout -b $1 origin/main
}


# TODO: Plan adding git global config to the repo
