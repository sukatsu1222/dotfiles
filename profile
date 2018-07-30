#
# ~/.profile
#

if [ -n "$BASH_VERSION" ]; then
    if [ -f "${HOME}/.bash_profile" ]; then
        . "${HOME}/.bash_profile"
    elif [ -f "${HOME}/.bashrc" ]; then
        . "${HOME}/.bashrc"
    fi
fi

