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

bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

bindkey "^I" menu-complete
bindkey "^[[Z" reverse-menu-complete

bindkey -M viins "^w" backward-kill-word
