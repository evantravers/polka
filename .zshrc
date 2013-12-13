# load plugins
autoload -U colors; colors
# colored prompt
autoload -U promptinit; promptinit
autoload -Uz vzs_info

# enable autocompletion
autoload -U compinit; compinit
zstyle ':completion:*' menu select
setopt completealiases

typeset -U path

# paths are for winners
path=(
  ${HOME}/.rubies/bin
  ${HOME}/bin
  $(brew --prefix)/bin
  /usr/bin
  /bin
  $(brew --prefix)/sbin
  /usr/sbin
  /sbin
  /usr/X11/bin
  $(brew --cellar)/python
  $(brew --cellar)/npm/bin
)

# set yo rubies son
eval "$(rbenv init --no-rehash - zsh)"

# use emacs bindings
bindkey -e

# remember history between sessions
HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=1000

# ====================
# bindings and aliases
# ====================

# use fasd
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="$HOME/.fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
  alias v='f -e vim'
  alias o='a -e open'
fi

alias la="ls -A"
alias lt='ls -lhart'
alias ll="ls -lsvAt"
alias git="hub"

# start stop pg
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'

# mongo
alias mongorun="mongod run --config /usr/local/etc/mongod.conf"
alias engage="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1"

# simple server
alias serve="python -m SimpleHTTPServer"

# ====================
# program settings
# ====================

ACK_PAGER="less -FXR"
export ACK_PAGER

LESS="-FXR"
export LESS

EDITOR="vim"
CLICOLOR=1

VISUAL="$EDITOR"
FCEDIT="$EDITOR"
GIT_EDITOR="$EDITOR"
GEM_EDITOR="$EDITOR"

export FCEDIT VISUAL GIT_EDITOR GEM_EDITOR

alias ls="gls --color=auto"

# ====================
# prompt customization
# ====================

# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "in %{$fg[magenta]%}%b%{$reset_color%} %m%u%c"
precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%{$fg[red]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}%~%{$reset_color%} ${vcs_info_msg_0_}
❯ '
