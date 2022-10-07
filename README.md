# .dotfiles

git config --global core.autocrlf false
git config --global init.defaultBranch main
git config --global user.name "lgf"   
git config --global user.email "lgf_136@163.com"

git  clone git@github.com:lgf-136/.dotfiles.git ~/.dotfiles
rm -f ~/.zshrc ~/.bashrc
ln -s -f ~/.dotfiles/zsh/.zshrc  ~/.zshrc
ln -s -f ~/.dotfiles/bash/.bashrc  ~/.bashrc

