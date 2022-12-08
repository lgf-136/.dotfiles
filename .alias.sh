#! /bin/sh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# git
# alias sshkey='ssh-keygen -t rsa -b 1024 -f yourkeyname -C "备注"'
alias sshkey='ssh-keygen -t rsa -C "lgf"'
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
alias dev='cd /home/lgf/code'
alias cu='su - lgf'
alias cr='su - root'
alias update='cd ~/.dotfiles && git pull && cd -'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='gvim'
alias md='mkdir -p'

alias vz='vim ~/.zshrc'
alias vb='vim ~/.bashrc'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ "${distribution}" = "msys2" ]; then
  alias ep='explorer.exe .'
  alias npp5="notepad.exe /c/Users/lgf/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
  alias npp7="notepad.exe /c/Users/lgf/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
  alias npz='notepad.exe ~/.zshrc'
  alias npb='notepad.exe ~/.bashrc'
fi
if [[ $A == *$B* ]]; then
  alias ep='explorer.exe .'
  alias npp5="notepad.exe /mnt/c/Users/lgf/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
  alias npp7="notepad.exe /mnt/c/Users/lgf/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
  alias npz='notepad.exe ~/.zshrc'
  alias npb='notepad.exe ~/.bashrc'
fi
