#zmodload zsh/zprof

# import zplug plugins
. ~/.zplugins

# import functions
for function in ~/.zsh/functions/*; do
  . $function
done

# import configs from ~/.zsh/configs/pre, then ~/.zsh/configs,
# then ~/.zsh/configs/post
_load_settings() {
  _dir="$1"

  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        if [ ${config:e} = "zwc" ]; then continue; fi
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;

        "$_dir"/post/*)
          :
          ;;

        *)
          if [[ -f $config && ${config:e} != "zwc" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        if [ ${config:e} = "zwc" ]; then continue; fi
        . $config
      done
    fi
  fi
}

_load_settings "$HOME/.zsh/configs"

# local config
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# import aliases
[[ -f ~/.aliases ]] && source ~/.aliases

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.8/bin/terraform terraform

#zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

