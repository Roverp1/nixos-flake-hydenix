WORDCHARS="_"

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

bindkey -M viins "^w" backward-kill-word
