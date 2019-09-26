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
[[ -f ~/.aliases ]] && source ~/.aliases

# fnm
eval "$(fnm env)"

#zprof
