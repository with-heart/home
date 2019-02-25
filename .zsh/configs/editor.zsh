if command_exists "nvim"; then
  VISUAL="NVIM_TUI_ENABLE_COLOR=1 nvim"
elif command_exists "mvim"; then
  VISUAL="mvim -v"
else
  VISUAL="vim"
fi

export VISUAL="$VISUAL"
export EDITOR="$VISUAL"
