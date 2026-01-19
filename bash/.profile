export PATH="$PATH:$HOME/apps"
export PATH=$PATH:/usr/local/go/bin
#alias v="$HOME/apps/nvim-linux-x86_64.appimage"
alias v="nvim" 
alias vim="nvim"
# alias ls="eza -la"
# alias fzf="$HOME/apps/fzf"
alias s="vim $HOME/.profile  && source $HOME/.profile"

#alias rg="$HOME/apps/rg"
#alias lazygit="$HOME/apps/lazygit"

eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(zoxide init bash)"
# alias cd="z"

alias t="tmux"
alias ta="tmux a"
