# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:$PATH"

# mkdir .git/safe in the root of repos I trust
# adds node_modules/.bin to PATH
PATH=".git/safe/../../node_modules/.bin:$PATH"

export -U PATH
