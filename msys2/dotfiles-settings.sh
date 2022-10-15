#! /bin/sh

. ./scripts/common.sh

info "dot files settings"
rm -rf ~/.dotfiles
git  clone git@github.com:lgf-136/.dotfiles.git ~/.dotfiles
rm -f ~/.zshrc ~/.bashrc ~/.common.sh ~/.exports.sh ~/.alias.sh ~/.functions.sh ~/.gitconfig
ln -s -f ~/.dotfiles/msys2/.zshrc  ~/.zshrc
ln -s -f ~/.dotfiles/msys2/.bashrc  ~/.bashrc
ln -s -f ~/.dotfiles/msys2/.common.sh  ~/.common.sh
ln -s -f ~/.dotfiles/msys2/.exports.sh  ~/.exports.sh
ln -s -f ~/.dotfiles/msys2/.alias.sh  ~/.alias.sh
ln -s -f ~/.dotfiles/msys2/.functions.sh  ~/.functions.sh
ln -s -f ~/.dotfiles/msys2/.gitconfig  ~/.gitconfig
