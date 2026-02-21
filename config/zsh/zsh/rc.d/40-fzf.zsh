## fzf
# Configure fzf sources, widgets, and completion UI.

## fzf source commands
# Prefer ripgrep for speed, fall back to find when unavailable.
if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
else
  export FZF_DEFAULT_COMMAND='command find -L . -mindepth 1 \( -path "*/.git/*" -o -path "*/.cache/*" \) -prune -o -type f -print'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

## fzf theme (Monokai)
export FZF_DEFAULT_OPTS="--color=bg:#272822,fg:#f8f8f2,hl:#a6e22e,fg+:#f8f8f2,bg+:#3e3d32,hl+:#66d9ef,info:#75715e,prompt:#f4bf75,pointer:#f92672,marker:#ae81ff,spinner:#66d9ef,header:#75715e"

## fzf-tab settings
# Drive long completion lists through fzf with a compact layout.
zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse --info=inline
zstyle ':fzf-tab:*' switch-group ',' '.'

## fzf widgets
# Autoload widget functions from the functions directory.
autoload -Uz fzf-history-widget

## Widget registration and key bindings
# Register widgets with zle and map keys to the fzf menus.
zle -N fzf-history-widget

bindkey '^R' fzf-history-widget

_zsh_fzf_bind_ctrl_r() {
  autoload -Uz fzf-history-widget
  zle -N fzf-history-widget
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M emacs '^R' fzf-history-widget
}

typeset -ga zvm_after_init_commands
zvm_after_init_commands+=(_zsh_fzf_bind_ctrl_r)
