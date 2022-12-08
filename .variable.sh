#! /bin/sh

distribution=$(cat /etc/*-release | grep "^ID=" | tr -d "ID=")
A="$(uname -r)"
B="WSL"
