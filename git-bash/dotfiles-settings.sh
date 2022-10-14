#! /bin/sh

. ./scripts/common.sh

info "dot files settings"
rm -rf ~/.dotfiles
git  clone git@github.com:lgf-136/.dotfiles.git ~/.dotfiles
rm -f ~/.zshrc ~/.bashrc ~/.common.sh ~/.exports.sh ~/.alias.sh ~/.functions.sh ~/.gitconfig
ln -s -f ~/.dotfiles/git-bash/.zshrc  ~/.zshrc
ln -s -f ~/.dotfiles/git-bash/.bashrc  ~/.bashrc
ln -s -f ~/.dotfiles/git-bash/.common.sh  ~/.common.sh
ln -s -f ~/.dotfiles/git-bash/.exports.sh  ~/.exports.sh
ln -s -f ~/.dotfiles/git-bash/.alias.sh  ~/.alias.sh
ln -s -f ~/.dotfiles/git-bash/.functions.sh  ~/.functions.sh
ln -s -f ~/.dotfiles/git-bash/.gitconfig  ~/.gitconfig
