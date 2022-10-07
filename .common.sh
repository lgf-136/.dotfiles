#! /bin/sh

distribution=$(cat /etc/*-release|grep "^ID="|tr -d "ID=")

info() {
    echo "---------------$1----------------"
}
si(){
   if [ "${distribution}" = "ubuntu" ]; then
    echo "Ubuntu"
    sudo apt-get install -y "$@"
   elif [ "${distribution}" = "deepin" ]; then
    echo "Deepin"
    sudo apt-get install -y "$@"
   elif [ "${distribution}" = "debian" ]; then
    echo "Debian"
    sudo apt-get install -y "$@"
   elif [ "${distribution}" = "kali" ]; then
    echo "Kali"
    sudo apt-get install -y "$@"
   elif grep -Eq "Alpine" /etc/*-release; then
    echo "Alpine"
    apk add "$@"
   else
    echo "macos"
   fi

}