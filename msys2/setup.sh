#! /bin/sh
# 清华镜像源： https://mirrors.tuna.tsinghua.edu.cn/help/msys2/
pacman -Syyu

pacman -S --noconfirm base-devel mingw-w64-x86_64-toolchain git bash zsh csh ksh tmux fish vim emacs nano python python3-pip perl ruby
# pacman -S --noconfirm msys/make msys/cmake msys/automake msys/gcc msys/g++ msys/gdb
pacman -S --noconfirm mingw-w64-x86_64-make mingw-w64-x86_64-cmake mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb mingw-w64-x86_64-openssl
pacman -S --noconfirm mingw-w64-x86_64-fzf mingw-w64-x86_64-bat
pacman -S --noconfirm mingw-w64-x86_64-julia mingw-w64-x86_64-go mingw-w64-x86_64-rust

pacman -Sy
pacman -S --needed filesystem msys2-runtime bash libreadline libiconv libarchive libgpgme libcurl pacman ncurses libintl
pacman -S mingw-w64-x86_64-toolchain
pacman -S mingw-w64-i686-toolchain
pacman -S base-devel
pacman -S vim

# https://github.com/zellij-org/zellij
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# echo "source $HOME/.cargo/env" >> ~/.zshrc && zsh
# echo "source $HOME/.cargo/env" >> ~/.bashrc && bash

# Rust crates.io 索引镜像使用帮助: https://mirrors.tuna.tsinghua.edu.cn/help/crates.io-index.git/
# 编辑 ~/.cargo/config 文件，添加以下内容：

mkdir - p ~/.cargo
# vim ~/.cargo/config
cat>~/.cargo/config<<EOF
[source.crates-io]
replace-with = "tuna"
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
EOF
该镜像可加快 cargo 读取软件包索引的速度。


cargo install lsd sd fd-find broot bottom gping du-dust git-delta zellij