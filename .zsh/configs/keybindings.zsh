# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^[d' backward-kill-word
bindkey '^U' kill-whole-line
