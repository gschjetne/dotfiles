# Add to PATH variable
add ()
{
  [[ -d $1 ]] && export PATH=$1:$PATH
}

# Add Snaps to PATH
add /snap/bin/

# Private scripts
add $HOME/bin
add $HOME/.local/bin
