# export PATH="$PATH:$HOME/apps"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/.asdf/installs/golang/1.25.6/bin:$PATH"
export GOROOT=~/.asdf/installs/golang/1.25.6/go

export GOPRIVATE=github.com/verily-src/*

### Startup tools
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

### TOOL: nvim
alias v="nvim" 
alias vim="nvim"
alias s="vim $HOME/.profile  && source $HOME/.profile"


### TOOL: tmux
alias t="tmux"
alias ta="tmux a"
alias ts="tmux source ~/.tmux.conf"


### TOOL: asdf completions ###
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
eval $(minikube -p minikube docker-env)

