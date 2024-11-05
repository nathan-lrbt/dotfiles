 #>>> conda initialize >>>
 # !! Contents within this block are managed by 'conda init' !!
 eval /home/nathan/miniconda3//bin/conda "shell.fish" "hook" $argv | source
 # <<< conda initialize <<<

 if status is-interactive
    # Commands to run in interactive sessions can go here
end

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

starship init fish | source

alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias la='ls -a'
alias ll='eza -lh'
alias vpn='sudo openfortivpn remote.unige.ch -u lherbet1'
alias f='fuck'
alias update="yay -Syu && yay -Scc"
alias gh="exec ssh-agent zsh && ssh-add -k ~/.shh/github"
alias cat="bat"

eval "$(fzf --fish)"
eval "$(zoxide init --cmd cd fish)"
eval "$(zoxide init fish)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

set fg "#CBE0F0"
set bg "#011628"
set bg_highlight "#143652"
set purple "#B388FF"
set blue "#06BCE4"
set cyan "#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:$fg,bg:$bg,hl:$purple,fg+:$fg,bg+:$bg_highlight,hl+:$purple,info:$blue,prompt:$cyan,pointer:$cyan,marker:$cyan,spinner:$cyan,header:$cyan"

# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"


thefuck --alias | source

set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
