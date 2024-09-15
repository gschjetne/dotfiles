function theme_precmd() {
    if git_toplevel=$(git rev-parse --show-toplevel 2>/dev/null) &&
        [[ $git_toplevel != $HOME ]]; then
        git_toplevel=$(basename $git_toplevel)
        branch=$(git branch --show-current)
        git_prompt=" [$git_toplevel  $branch]"
    else
        git_prompt=""
    fi

    PROMPT="%F{blue}  :   %f[%m %3~]$git_prompt %(?.▶.%F{red}▶%f) "
}

function theme_preexec() {
    print -P "\033[1A%F{blue}%T%f"
}

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
add-zsh-hook preexec theme_preexec

