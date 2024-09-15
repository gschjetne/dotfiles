export EDITOR=nvim

# On WSL2 DISPLAY must be set to :0
[[ $(uname -r) = *WSL2 ]] && export DISPLAY=:0

alias vi=nvim
alias e=$EDITOR
