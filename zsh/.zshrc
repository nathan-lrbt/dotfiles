# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
# if [ -n "$TTY" ]; then
#   export GPG_TTY=$(tty)
# else
#   export GPG_TTY="$TTY"
# fi

# remove env prefix in prompt
export CONDA_CHANGEPS1=false

PATH="$HOME/.go/bin:$PATH"
PATH="$HOME/go/bin:$PATH"

export EDITOR=nvim

# # SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
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


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

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
