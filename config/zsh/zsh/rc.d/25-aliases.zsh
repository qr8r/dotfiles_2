## Aliases
# Prefer yq when tools call jq.
if (( $+commands[yq] )); then
  alias jq='yq'
fi

# Rebuild antidote's static plugin bundle after plugin list changes.
# This bypasses stale mtime checks and restarts a clean login shell.
alias zrebundle='source ~/.local/share/antidote/antidote.zsh && antidote bundle < ~/.config/zsh/antidote.plugins >| ~/.local/share/antidote/antidote-bundle.zsh && exec zsh -l'
