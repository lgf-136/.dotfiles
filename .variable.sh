#! /bin/sh

distribution=$(cat /etc/*-release | grep "^ID=" | tr -d "ID=")
A="$(uname -r)"
B="WSL"

# if type go >/dev/null 2>&1; then
#   go env -w GO111MODULE=on
#   go env -w GOPROXY=https://goproxy.cn
# fi
