export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

if [[ -r "$ZDOTDIR/.zshenv" ]]; then
  source "$ZDOTDIR/.zshenv"
fi
