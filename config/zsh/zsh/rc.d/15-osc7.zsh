## Terminal OSC-7 integration
# Emit OSC-7 so terminals can track the current directory.

autoload -Uz add-zsh-hook

_osc7_update_pwd() {
  print -Pn "\e]7;file://$HOST${PWD// /%20}\e\\"
}

add-zsh-hook chpwd _osc7_update_pwd
add-zsh-hook precmd _osc7_update_pwd
