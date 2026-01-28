## General shell behavior
# Disable terminal bell to keep prompts quiet during errors or completion.
setopt no_beep

## Autoloadable function lookup
# Maintain a unique function search path and place user paths first so local
# definitions override any system-provided versions.
typeset -U fpath
fpath=(
  "$ZDOTDIR/site-functions"
  "$ZDOTDIR/functions"
  "$ZDOTDIR/completions"
  $fpath
)

## Cache and state directories
# Ensure XDG locations exist before we use completion caches and history.
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi

if [[ ! -d "$XDG_STATE_HOME/zsh" ]]; then
  mkdir -p "$XDG_STATE_HOME/zsh"
fi

## Keymap
# Use vim-style keybindings for consistent editing commands.
bindkey -v

## Environment hooks
# Load direnv for per-project environment variables.
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
