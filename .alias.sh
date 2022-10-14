#! /bin/sh

. ~/.common.sh

# git
alias ga="git add ."
alias gcm="git commit -m"
alias gcam="git add . && git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout main"
alias gst="git status"
alias ginit='git init && git config --local core.autocrlf false'

# Navigation
# alias -='cd -' # FIXME: bad option: -=
alias ~="cd ~"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias ll='ls -lh'
alias la='ls -lha'
alias dev='cd /home/lgf/code'
alias lgf='cd /home/lgf'
alias cu='su - lgf'
alias cr='su -root'
alias update='cd ~/.dotfiles && git pull && cd -'

alias ep='explorer.exe .'
