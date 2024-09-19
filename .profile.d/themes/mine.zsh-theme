function theme_precmd() {
    local clock_fg="#222436"
    local clock_bg="#737aa2"
    local host_fg="#1e2030"
    local host_bg="#545c7e"
    local path_fg="#c8d3f5"
    local path_bg="#3b4261"
    local git_fg="#737aa2"
    local git_bg="#2f334d"
    local error_fg="#c8d3f5"
    local error_bg="#c53b53"
    local dollar_fg="#797aa2"


    local clock="%F{$clock_fg}%K{$clock_bg} %T %F{$clock_bg}"

    case $HOST in
        Pfhor) local host_icon=" ";;
        SEGOT*) local host_icon=" ";;
        *) local host_icon=$HOST;;
    esac

    local host_icon="%K{$host_bg}%F{$host_fg} $host_icon%F{$host_bg}"
    local working_dir="%K{$path_bg}%F{$path_fg} %3~ %F{$path_bg}"

    if git_toplevel=$(git rev-parse --show-toplevel 2>/dev/null) &&
        [[ $git_toplevel != $HOME ]]; then
        branch=$(git branch --show-current)

        if [[ -z $(git status --porcelain) ]]; then
            local git_color="#c3e88d"
        else
            local git_color="#ff757f"
        fi

        local git_info="%F{$git_color}%F{$git_fg} $branch"
        local git_prompt="%K{$git_bg}%F{$git_fg} $git_info %F{$git_bg}"
    else
        local git_prompt=""
    fi

    local error="%K{$error_bg}%F{$error_fg} %? %F{$error_bg}"

    PROMPT="$clock$host_icon$working_dir$git_prompt%(?..$error)%k%F{$dollar_fg}  %f"
}

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd

