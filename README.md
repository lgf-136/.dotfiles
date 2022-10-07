# .dotfiles

git  clone git@github.com:lgf-136/.dotfiles.git ~/.dotfiles
rm -f ~/.zshrc ~/.bashrc
ln -s -f ~/.dotfiles/zsh/.zshrc  ~/.zshrc
ln -s -f ~/.dotfiles/bash/.bashrc  ~/.bashrc

