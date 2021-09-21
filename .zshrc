#zmodload zsh/zprof

# import zplug plugins
. ~/.zplugins

# import utility functions
. ~/.functions

# import settings
. ~/.settings

# local config
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# import aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# import path shortcuts
[[ -f ~/.paths ]] && . ~/.paths

# initialize starship prompt
eval "$(starship init zsh)"

#zprof

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
