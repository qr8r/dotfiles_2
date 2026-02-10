## Plugin manager
# Antidote is bootstrapped into XDG_DATA_HOME for writable storage.
export ANTIDOTE_HOME="${XDG_DATA_HOME}/antidote"
antidote_bootstrap_url="https://codeload.github.com/mattmc3/antidote/tar.gz/refs/heads/main"
antidote_entrypoint="$ANTIDOTE_HOME/antidote.zsh"
antidote_setup_fn="$ANTIDOTE_HOME/functions/__antidote_setup"

if [[ ! -r "$antidote_entrypoint" || ! -r "$antidote_setup_fn" ]]; then
  tmp_dir="$(mktemp -d)"

  if (( $+commands[curl] )); then
    curl -fsSL "$antidote_bootstrap_url" | tar -xz -C "$tmp_dir"
  fi

  if [[ -d "$tmp_dir/antidote-main" ]]; then
    rm -rf "$ANTIDOTE_HOME"
    mkdir -p "$ANTIDOTE_HOME"
    cp -R "$tmp_dir/antidote-main/"* "$ANTIDOTE_HOME/"
  fi

  rm -rf "$tmp_dir"
fi

if [[ -r "$antidote_entrypoint" ]]; then
  source "$antidote_entrypoint"

  # Antidote defaults to writing the generated static bundle next to the
  # bundle list (usually under $ZDOTDIR), which is read-only with Home Manager.
  # Override both paths so the list stays in the config tree while the generated
  # bundle lives under XDG_DATA_HOME where zsh can write.
  zstyle ':antidote:bundle' file "$ZDOTDIR/antidote.plugins"
  zstyle ':antidote:static' file "$XDG_DATA_HOME/antidote/antidote-bundle.zsh"

  antidote load
fi
