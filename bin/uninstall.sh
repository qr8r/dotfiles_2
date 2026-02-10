#!/usr/bin/env bash

set -euo pipefail 

configs_src_path="$HOME/.config/.dotfiles/config"
configs_target_path="$HOME/.config/"

find "$configs_src_path" -type d -depth 1  \
  ! -name "zsh" \
  ! -name "fuzzel" \
  ! -name "keyd" \
  ! -name "mako" \
  ! -name "sway" \
  ! -name "swaylock" \
  ! -name "waybar" \
  ! -name "yazi" \
  | while read -r path; do
    target="$configs_target_path/$(basename "$path")"
    [[ -L "$target" ]] && rm "$target"
  done 

[[ -L "$HOME/.zshenv" ]] && rm "$HOME/.zshenv"
[[ -L "$configs_target_path/zsh" ]] && rm "$configs_target_path/zsh"

