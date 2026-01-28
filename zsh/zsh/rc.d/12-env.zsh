## Editor and pager defaults
# Prefer nvim for editing and bat for paging with a less fallback.

export EDITOR=nvim
export VISUAL=nvim

if (( $+commands[bat] )); then
  export PAGER='bat --paging=always --style=plain'
  export MANPAGER='sh -c "col -bx | bat --paging=always --style=plain --language=man"'
  export GIT_PAGER=delta
else
  export PAGER=less
  export LESS='-FIRX'
  export LESSHISTFILE=-
  export GIT_PAGER=delta
fi
