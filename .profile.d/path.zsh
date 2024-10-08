# Add to PATH variable
add ()
{
  [[ -d $1 ]] && export PATH=$1:$PATH
}

# Add Snaps to PATH
add /snap/bin/

# Add go
add $HOME/go/bin
add /usr/local/go/bin/

# Add Zig
add $HOME/.zig

# Private scripts
add $HOME/bin
add $HOME/.local/bin
