export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Options
setopt extended_glob
setopt glob_dots

setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_reduce_blanks hist_ignore_space
setopt hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"
[[ ! -d "$(dirname $HISTFILE)" ]] && mkdir -p "$dirname $HISTFILE"

# Key binds
bindkey -v

bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

bindkey -M viins "^w" backward-kill-word

# Completion system
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

setopt auto_list
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|
=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
