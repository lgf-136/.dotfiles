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
alias dev='cd /e/code'
alias lgf='cd /home/13662'
alias cu='su - lgf'
alias cr='su -root'
alias ls='ls --show-control-chars --color=auto' 

alias ep='explorer.exe .'
alias npm='npm.cmd'
alias npx='npx.cmd'
alias npx='yarn.cmd'
alias npx='pnpm.cmd'
alias npx='cnpm.cmd'

alias update='cd ~/.dotfiles && git pull && cd .. && \
              rm -f ~/.zshrc ~/.bashrc ~/.common.sh ~/.exports.sh ~/.alias.sh ~/.functions.sh ~/.gitconfig && \
              ln -s -f ~/.dotfiles/msys2/.zshrc  ~/.zshrc && \
              ln -s -f ~/.dotfiles/msys2/.bashrc  ~/.bashrc && \
              ln -s -f ~/.dotfiles/msys2/.common.sh  ~/.common.sh && \
              ln -s -f ~/.dotfiles/msys2/.exports.sh  ~/.exports.sh && \
              ln -s -f ~/.dotfiles/msys2/.alias.sh  ~/.alias.sh && \
              ln -s -f ~/.dotfiles/msys2/.functions.sh  ~/.functions.sh && \
              ln -s -f ~/.dotfiles/msys2/.gitconfig  ~/.gitconfig
            '
            