export PATH="$PATH:$HOME/apps"
export PATH=$PATH:/usr/local/go/bin
alias v="$HOME/apps/nvim-linux-x86_64.appimage"
alias vim="v"
alias nvim="v"
alias ls="eza -la"
alias fzf="$HOME/apps/fzf"
alias s="vim $HOME/.bashrc && source $HOME/.bashrc"

alias rg="$HOME/apps/rg"
alias lazygit="$HOME/apps/lazygit"

eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(zoxide init bash)"
alias cd="z"
