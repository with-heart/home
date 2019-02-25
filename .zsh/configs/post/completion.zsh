fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# enabled completion; use cache if < 24h old
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump
else
  compinit -C
fi

compdef -d mcd
