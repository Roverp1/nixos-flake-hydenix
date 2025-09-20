WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

# Options
setopt extended_glob
setopt glob_dots

# History
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Key binds
bindkey -v

bindkey "^f" autosuggest-accept

bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

bindkey "^I" menu-complete
bindkey "^[[Z" reverse-menu-complete

bindkey -M viins "^w" backward-kill-word

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:descriptions' format '%B%d%b'
