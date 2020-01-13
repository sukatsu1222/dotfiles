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
        target=${HOME}/.config/$(basename $config_dir)
        create_symlink $config_dir $target
      done
      ;;
    bin )
      target=${HOME}/bin
      create_symlink $dot_file $target
      ;;
    * )
      target=${HOME}/.$(basename $dot_file)
      create_symlink $dot_file $target
      ;;
  esac
done
