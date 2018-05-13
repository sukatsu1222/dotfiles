# zsh/z1_zplug.zsh
ZPLUG_HOME=${HOME}/.zplug
if [[ ! -d ${ZPLUG_HOME} ]]; then
  git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
fi

## Essential
source ${ZPLUG_HOME}/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

## Then, source plugins and add commands to $PATH
zplug load --verbose
