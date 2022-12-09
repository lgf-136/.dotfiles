#! /bin/sh

program_exists() {
  local ret='0'
  command -v $1 >/dev/null 2>&1 || { local ret='1'; }
  # type $1 >/dev/null 2>&1 || { local ret='1'; }

  # fail on non-zero return value
  if [ "$ret" -ne 0 ]; then
    echo $1 has not been installed!
    return 1
  fi
  echo $1 has been installed!
  return 0
}

is_command_exists() {
  if type $1 >/dev/null 2>&1; then
    echo $1 command existed
    return 1
  else
    echo $1 command did not existed yet!
    return 0
  fi
}

info() {
  echo "---------------$1----------------"
}
si() {
  if [ "${distribution}" = "ubuntu" ]; then
    echo "install package on Ubuntu"
    sudo apt-get install -y "$@"
  elif [ "${distribution}" = "deepin" ]; then
    echo "install package on Deepin"
    sudo apt-get install -y "$@"
  elif [ "${distribution}" = "debian" ]; then
    echo "install package on Debian"
    sudo apt-get install -y "$@"
  elif [ "${distribution}" = "kali" ]; then
    echo "install package on Kali"
    sudo apt-get install -y "$@"
  elif [ "${distribution}" = "rhel" ]; then
    echo "install package on rhel"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "fedora" ]; then
    echo "install package on fedora"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "centos" ]; then
    echo "install package on centos"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "almalinux" ]; then
    echo "install package on almalinux"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "rocky" ]; then
    echo "install package on rocky-linux"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "oracle" ]; then
    echo "install package on oracle-linux"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "manjaro" ]; then
    echo "install package on manjaro"
    sudo pacman -S --noconfirm "$@"
  elif [ "${distribution}" = "arch" ]; then
    echo "install package on arch-linux"
    sudo pacman -S --noconfirm --needed "$@"
  elif [ "${distribution}" = "msys2" ]; then
    echo "install package on msys2 with windows platform"
    pacman -S --noconfirm --needed "$@"
  elif [ "${distribution}" = "freebsd" ]; then
    echo "install package on freebsd"
    sudo yum install -y "$@"
  elif [ "${distribution}" = "opensuse" ]; then
    echo "install package on opensuse"
    sudo yum install -y "$@"
  elif grep -Eq "Alpine" /etc/*-release; then
    echo "install package on Alpine"
    apk add "$@"
  else
    echo "install package on macos"
    brew install -y "$@"
  fi

}

go_proxy() {
  go env -w GO111MODULE=on
  go env -w GOPROXY=https://goproxy.cn
}
gg_init() {
  git config --global user.name "lgf"
  git config --global user.email "1366256652@qq.com"
  git config --global init.defaultBranch main
  git config --global core.autocrlf false
  git config --global http.sslverify false
  git config --global https.sslverify false
  git config --global pull.rebase false
  git config --global core.quotepath false
}
gl_init() {
  git config --local user.name "lgf"
  git config --local user.email "1366256652@qq.com"
  git config --local init.defaultBranch main
  git config --local core.autocrlf false
  git config --local http.sslverify false
  git config --local https.sslverify false
  git config --local pull.rebase false
  git config --local core.quotepath false
}

#.# Better Git Logs.
# https://cubox.pro/my/card?id=ff8080818381afe80183baad56c02b2b
### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).

gitignore() {
  curl -L -s https://www.gitignore.io/api/$@ >.gitignore
}

# Git Commit, Add all and Push — in one step.

gcap() {
  git add . && git commit -m "$*" && git push
}

# FEAT.
gfeat() {
  gcap "✏️ feat: $@"
}

# IMPROVE.
gimp() {
  gcap "📈 improve: $@"
}

# FIX.
gfix() {
  gcap "🔧 fix: $@"
}

# RELEASE.
grls() {
  gcap "🚀 release: $@"
}

# DOC.
gdoc() {
  gcap "📑 doc: $@"
}

# TEST.
gtst() {
  gcap "✅ test: $@"
}

# CHORE.
gchore() {
  gcap "📌 chore: $@"
}

pj() {
  mkdir -p $1
  cd $1
  git init
  git config --local user.name "lgf-136"
  git config --local user.email "lgf_136@163.com"
  git config --local core.autocrlf false
  git config --local pull.rebase false
  git config --local init.defaultBranch main
  # 中文乱码
  git config --local core.quotepath false
  git config --local http.sslVerify false
  git config --local https.sslVerify false

  # git config --global user.name "lgf"
  # git config --global user.email "1366256652@qq.com"
  # git config --global init.defaultBranch main
  # git config --global core.autocrlf false
  # git config --global http.sslverify false
  # git config --global https.sslverify false
  # git config --global pull.rebase false
  # git config --global core.quotepath false
}

install_neovim() {
  is_command_exists nvim
  if [ $? -eq 0 ]; then
    version=$1
    echo will install nvim
    rm -f ./nvim-linux64.tar.gz
    wget https://ghproxy.com/https://github.com/neovim/neovim/releases/download/v$version/nvim-linux64.tar.gz
    tar -xvf nvim-linux64.tar.gz
    sudo mv nvim-linux64 /usr/local/nvim
    sudo ln -s /usr/local/nvim/bin/nvim /usr/bin/nvim
    rm -f ./nvim-linux64.tar.gz
  fi
}

install_vim_git() {
  is_command_exists vim
  if [ $? -eq 0 ]; then
    git clone --depth 1 -b master https://github.com/vim/vim.git
    # 到vim目录下
    cd vim
    ./configure --with-features=huge \
      --enable-multibyte \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python-config-dir=/usr/lib/python3.10/config-3.10m-x86_64-linux-gnu \
      --enable-perlinterp=yes \
      --enable-luainterp=yes \
      --enable-gui=gtk2 \
      --enable-cscope \
      --prefix=/usr/local/vim9

    make -j
    make install

    echo "export PATH=/usr/local/vim9/bin/:\$PATH" >>~/.bashrc
    echo "export PATH=/usr/local/vim9/bin/:\$PATH" >>~/.zshrc
    source ~/.bashrc
  fi
}
install_vim() {
  # sudo dnf install -y wget git python3-devel ncurses-devel.x86_64
  cd
  version=$1
  wget https://ghproxy.com/https://github.com//vim/vim/archive/refs/tags/v$version.tar.gz
  tar -xvf v$version.tar.gz
  sudo mv vim-$version vim
  sudo mv vim /usr/local/
  cd /usr/local/vim/src
  ./configure --prefix=/opt/vim --enable-luainterp=yes --enable-pythoninterp=yes --with-python3-command=python3 --with-python3-config-dir=/usr/lib/python3.10/config-3.10m-x86_64-linux-gnu --enable-python3interp=yes --enable-tclinterp=yes --enable-rubyinterp=yes --enable-cscope --enable-terminal --enable-multibyte --with-tclsh=tclsh --with-ruby-command=ruby
  sudo make install
  if [ -f "/usr/local/sbin/vim" ]; then
    sudo mv /usr/local/sbin/vim /usr/local/sbin/vim.bak
  fi
  if [ -f "/usr/bin/vim" ]; then
    sudo mv /usr/bin/vim /usr/bin/vim.bak
  fi
  sudo ln -s /opt/vim/bin/vim /usr/local/sbin/vim
  sudo ln -s /opt/vim/bin/vim /usr/bin/vim
  cd
  rm -rf vim-$version
  rm -rf v$version.tar.*

}

compile_vim_on_debian() {
  sudo apt-get update && sudo apt-get install -y libncurses5-dev libncurses5 libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev ruby-dev lua5.4 lua5.4-dev

  rm -rf ~/vim
  git clone https://gitee.com/lgf1244/vim9.git ~/vim
  cd ~/vim
  ./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr
  make
  sudo make install
  cd -
}

# compile_vim_on_ubuntu 2.7 3.10   test pass
compile_vim_on_ubuntu() {
  sudo apt-get install -y libncurses5-dev libncurses5 \
    libgtk2.0-dev libatk1.0-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev python3-dev ruby-dev lua5.3 lua5.3-dev

  rm -rf ~/vim
  git clone https://gitee.com/lgf1244/vim9.git ~/vim
  cd ~/vim
  ./configure --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib64/python$1/config-$1m-x86_64-linux-gnu \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib64/python$2/config-$2m-x86_64-linux-gnu \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local/vim
  sudo make
  sudo make install
  sudo rm -f /usr/bin/vim
  sudo ln -s /usr/local/vim/bin/vim /usr/bin/vim
  cd -
}

install_golang() {
  is_command_exists go
  if [ $? -eq 0 ]; then
    version=$1
    wget https://go.dev/dl/go$version.linux-amd64.tar.gz
    tar -xvf go$version.linux-amd64.tar.gz
    sudo mv go /usr/local
    echo "export GOROOT=/usr/local/go" >>~/.zshrc
    echo "export GOROOT=/usr/local/go" >>~/.bashrc
    echo "export PATH=:\$GOROOT/bin:\$PATH" >>~/.zshrc
    echo "export PATH=:\$GOROOT/bin:\$PATH" >>~/.bashrc
    # export GOPATH=$HOME/Projects/Proj1
    exec $SHELL
    go version
    rm -f ./go$version.linux-amd64.tar.gz
  fi
}

#  font
download_font() {
  # url="https://raw.githubusercontent.com/wsdjeg/DotFiles/7a75a186c6db9ad6f02cafba8d4c7bc78f47304c/local/share/fonts/${1// /%20}"
  url="https://gitee.com/lgf1244/omf/blob/master/my_favorite/${1// /%20}"
  path="$HOME/.local/share/fonts/$1"
  # Clean up after https://github.com/SpaceVim/SpaceVim/issues/2532
  if [[ -f "$path" && ! -s "$path" ]]; then
    rm "$path"
  fi
  if [[ -f "$path" ]]; then
    info "Downloaded $1"
  else
    info "Downloading $1"
    curl -s -o "$path" "$url"
    info "Downloaded $1"
  fi
}

# }}}

install_fonts() {
  if [[ ! -d "$HOME/.local/share/fonts" ]]; then
    mkdir -p $HOME/.local/share/fonts
  fi
  for i in "$@"; do
    download_font $i
  done
  # download_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
  info "Updating font cache, please wait ..."
  if [ $distribution = "Darwin" ]; then
    if [ ! -e "$HOME/Library/Fonts" ]; then
      mkdir "$HOME/Library/Fonts"
    fi
    cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
  else
    fc-cache -fv >/dev/null
    mkfontdir "$HOME/.local/share/fonts" >/dev/null
    mkfontscale "$HOME/.local/share/fonts" >/dev/null
  fi
  info "font cache done!"
}
