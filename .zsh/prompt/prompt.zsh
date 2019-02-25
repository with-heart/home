ZSH_THEME_GIT_PROMPT_PREFIX="%F{242}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{250}*%f%b"

NEWLINE='
'

HEART_PROMPT_SYMBOL="△"

heart::status() {
  echo -n "%B%(?.%F{white}.%F{red})${HEART_PROMPT_SYMBOL}%f%b  "
}

heart::user() {
  if [[ $USER == 'root' ]]; then
    echo -n "%F{red}"
  else
    echo -n "%F{yellow}"
  fi

  echo -n "%n"
}

heart::host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo -n "$(heart::user)@%m%f "
  elif [[ $LOGNAME != $USER ]] || [[ $USER == 'root' ]]; then
    echo -n "$(heart::user)%f "
  fi
}

heart::current_dir() {
  echo -n "%B%F{grey}%.%f%b "
}

heart::is_git() {
  command git rev-parse --is-inside-work-tree 2>&1
}

heart::git_status() {
  echo -n "$(git_prompt_status)$(git_prompt_info)"
}

setopt promptsubst
PROMPT='${NEWLINE}$(heart::status)$(heart::host)$(heart::current_dir)$(heart::git_status)'
