#! /bin/sh

if [ "${distribution}" = "msys2" ]; then
  export PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
  export PATH=$PATH:/mingw64/bin:/clang64/bin:/clangarm64/bin:/ucrt64/bin
  export PATH=$PATH:/mingw32/bin:/clang32/bin
  export PATH=$PATH:/c/Windows/System32:/c/Windows:/c/Windows/System32/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0/
  export PATH="$PATH:/c/Program Files/Microsoft VS Code:/c/Program Files/Kate/bin:/c/ProgramData/chocolatey/bin"
fi

if [[ $A == *$B* ]]; then
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib
  export PATH=$PATH:/mnt/c/Windows:/mnt/c/Windows/system32
  export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/ProgramData/chocolatey/bin"
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
fi

export PATH=$PATH:/home/lgf/.local/bin
export PYENV_ROOR="$HOME/.pyenv"
export PATH=~/.pyenv/libexec:$PATH
