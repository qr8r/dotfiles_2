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
    ln -sfn "$path" "$configs_target_path"
  done 

ln -sfn "$configs_src_path/zsh/.zshenv" "$HOME/.zshenv"
ln -sfn "$configs_src_path/zsh/zsh" "$configs_target_path/"

