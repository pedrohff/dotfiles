export PATH="$PATH:$HOME/apps"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin

alias v="nvim" 
alias vim="nvim"
alias s="vim $HOME/.profile  && source $HOME/.profile"


eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

alias t="tmux"
alias ta="tmux a"
alias ts="tmux source ~/.tmux.conf"
