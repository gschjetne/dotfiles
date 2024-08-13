export EDITOR=nvim
export GOPATH=$HOME/go

# On WSL2 DISPLAY must be set to :0
[[ $(uname -r) = *WSL2 ]] && export DISPLAY=:0
