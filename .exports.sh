#! /bin/sh

. ~/.common.sh

export PATH=$PATH:$HOME/.local/bin:/bin:/usr/bin:/usr/local/bin:/mnt/c/Windows:/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin

export PYENV_ROOR="$HOME/.pyenv"
export PATH=~/.pyenv/libexec:$PATH
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"