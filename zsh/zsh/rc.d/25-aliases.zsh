## Aliases
# Prefer yq when tools call jq.
if (( $+commands[yq] )); then
  alias jq='yq'
fi
