# support colors in less pages
set -a
MANROFFOPT='-c'
LESS_TERMCAP_mb=$'\e[1;31m'
LESS_TERMCAP_md=$'\e[1;31m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[1;33;44m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[4;1;32m'
LESS_TERMCAP_mr=$'\e[7m'
LESS_TERMCAP_mh=$'\e[2m'
LESS_TERMCAP_ZN=$'\e[74m'
LESS_TERMCAP_ZV=$'\e[75m'
LESS_TERMCAP_ZO=$'\e[73m'
LESS_TERMCAP_ZW=$'\e[75m'
MANPAGER='less'

# remove env prefix in prompt
CONDA_CHANGEPS1=false
PATH="$HOME/.local/bin:$PATH"

PATH="$HOME/.go/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"

EDITOR=nvim
set +a

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Prompt
eval "$(starship init zsh)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

zle_highlight+=(paste:none)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias la='ls -a'
alias ll='eza -lh --group'
alias vpn='sudo openfortivpn remote.unige.ch -u lherbet1'
alias f='fuck'
alias update="yay -Syu --noconfirm && yay -Scc --noconfirm"
alias gh="exec ssh-agent zsh && ssh-add -k ~/.shh/github"
alias cat="bat"
alias tree="eza --tree --icons=always"
alias lazy="lazygit"
alias jl="jupyter-lab --no-browser > /dev/null 2>&1 & disown && sleep 1 && jupyter server list | grep token | sed 's/ ::.*//' | wl-copy && printf 'link : ' && wl-paste"
alias kee="cat ~/KeePassXC/.config | wl-copy -n && sleep 5s && wl-copy -c && c"
alias z="zathura"
alias open="xdg-open"
alias tsu="tailscale up"
alias tsd="tailscale down"
alias tss="tailscale status"

# Toggle Tailscale connection
tailscale-toggle() {
  if tailscale status &>/dev/null; then
    echo "Tailscale is up — bringing it down..."
    sudo tailscale down
  else
    echo "Tailscale is down — bringing it up..."
    sudo tailscale up
  fi
}
alias tst='tailscale-toggle'
alias nosleep="systemd-inhibit --what=sleep:idle:handle-lid-switch --who='Nathan' --why='long process' sleep infinity &"


alias ls="eza --color=always --long --git --no-filesize --sort=type --icons=always --no-time --no-user --no-permissions"


# thefuck alias
eval $(thefuck --alias)


# >>> conda initialize >>>
. "/home/nathan/miniconda3/etc/profile.d/conda.sh"
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/home/nathan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/nathan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/nathan/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/nathan/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/nathan/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
conda() {
  unfunction conda
  __conda_setup="$('/home/nathan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  [ $? -eq 0 ] && eval "$__conda_setup"
  conda "$@"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opencode
export PATH=/home/nathan/.opencode/bin:$PATH
