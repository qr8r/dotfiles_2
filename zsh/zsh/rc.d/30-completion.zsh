## Completion system
# Load completion UI helpers and initialize completions with a cached dump.
zmodload zsh/complist
autoload -Uz compinit bashcompinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

## Completion styles
# Configure list behavior, descriptions, colors, and fuzzy matching.
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
