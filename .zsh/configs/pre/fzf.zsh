[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow -g "!**/{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_OPTS='--color fg:231,fg+:231,bg:16,bg+:236,hl:212,hl+:212,info:84,prompt:231,pointer:117,spinner:141,marker:215'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

