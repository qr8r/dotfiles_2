## Cursor shape in vi mode
# Use steady block in normal mode and steady beam in insert mode.
function _cursor_block() { print -n $'\e[2 q' }
function _cursor_beam() { print -n $'\e[6 q' }

function zle-keymap-select {
  case $KEYMAP in
    vicmd) _cursor_block ;;
    viins|main) _cursor_beam ;;
  esac
}

function zle-line-init {
  _cursor_beam
}

zle -N zle-keymap-select
zle -N zle-line-init
