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

eval "$(starship init zsh)"

#zprof
