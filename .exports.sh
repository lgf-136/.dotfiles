#! /bin/sh

export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOROOT=~/go
export GOPATH=/opt/go

export CARGO_HOME=~/.cargo
export RUSTUP_HOME=~/.rustup
export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup

if [ "${distribution}" = "msys2" ]; then
  export GOROOT=/d/dev-env/Go
  export GOPATH=/d/dev-env/Go/go
  export CARGO_HOME=/c/Users/lgf/.cargo
  export RUSTUP_HOME=/c/Users/lgf/.rustup
  export PATH=/d/dev-env/Anaconda3:/d/dev-env/Anaconda3/Scripts:/d/dev-env/Anaconda3/Library/mingw-w64/bin:/d/dev-env/Anaconda3/Library/usr/bin:/d/dev-env/Anaconda3/Library/bin
  export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/gVimPortable/App/vim
  export PATH=$PATH:/mingw64/bin:/clang64/bin:/clangarm64/bin:/ucrt64/bin
  export PATH=$PATH:/mingw32/bin:/clang32/bin
  export PATH=$PATH:/c/Windows/System32:/c/Windows:/c/Windows/System32/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0/
  export PATH="$PATH:/c/Program Files/Microsoft VS Code:/c/Program Files/Kate/bin:/c/ProgramData/chocolatey/bin:/c/Program Files/Java/jdk1.8.0_211/bin"
fi

if [[ $A == *$B* ]]; then
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib
  export PATH=$PATH:/mnt/c/Windows:/mnt/c/Windows/system32
  export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/ProgramData/chocolatey/bin"
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
fi

export PATH=$PATH:/home/lgf/.local/bin:$GOROOT/bin:$GOPATH/bin:$CARGO_HOME/bin
export PYENV_ROOR="$HOME/.pyenv"
export PATH=~/.pyenv/libexec:$PATH
