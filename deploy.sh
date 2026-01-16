#!/usr/bin/env bash

DOT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

color_message() {
  local message=$1
  local color=$2
  if tty -s <&1; then
    echo -e '\x1B['$color'm'$message'\x1B[0m'
  else
    echo $message
  fi
}

red() {
  color_message "$1" "31"
}

green() {
  color_message "$1" "32"
}

gray() {
  color_message "$1" "37"
}

create_symlink() {
  local src=$1 dst=$2
  if [[ -e $dst ]]; then
    gray "Override $src to $dst."
    rm -rf $dst
    ln -sf $src $dst
  else
    green "Symlink $src to $dst."
    ln -sf $src $dst
  fi
}

# Create ~/.config directory, if not existing
[[ ! -d ${HOME}/.config ]] && mkdir -p ${HOME}/.config

# Create dotfile symlinks
for dot_file in ${DOT_DIR}/*; do
  case $(basename $dot_file) in
    install.sh ) continue ;;
    deploy.sh) continue ;;
    *.md ) continue ;;
    config )
      for config_dir in $dot_file/*; do
        config_name=$(basename $config_dir)
        # ghostty と karabiner は macOS のみ
        if [[ "$config_name" == "ghostty" || "$config_name" == "karabiner" ]]; then
          if [[ "$(uname)" != "Darwin" ]]; then
            gray "Skip $config_name (macOS only)"
            continue
          fi
        fi
        target=${HOME}/.config/$config_name
        create_symlink $config_dir $target
      done
      ;;
    * )
      target=${HOME}/.$(basename $dot_file)
      create_symlink $dot_file $target
      ;;
  esac
done
