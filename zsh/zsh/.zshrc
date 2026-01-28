## Zsh configuration loader
# Source modular rc.d files in order.
if [[ -d "$ZDOTDIR/rc.d" ]]; then
  for config_file in "$ZDOTDIR/rc.d/"*.zsh; do
    if [[ -r "$config_file" ]]; then
      source "$config_file"
    fi
  done
fi
