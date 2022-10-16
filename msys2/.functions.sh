#! /bin/bash

. ~/.common.sh

#.# Better Git Logs.
# https://cubox.pro/my/card?id=ff8080818381afe80183baad56c02b2b
### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).

function gignore(){
    curl -L -s https://www.gitignore.io/api/$@ > .gitignore
}

# Git Commit, Add all and Push — in one step.

function gcap() {
    git add . && git commit -m "$*" && git push
}

# FEAT.
function gfeat() {
    gcap "✏️ feat: $@"
}

# IMPROVE.
function gimp() {
    gcap "📈 improve: $@"
}

# FIX.
function gfix() {
    gcap "🔧 fix: $@"
}

# RELEASE.
function grls() {
    gcap "🚀 release: $@"
}

# DOC.
function gdoc() {
    gcap "📑 doc: $@"
}

# TEST.
function gtst() {
    gcap "✅ test: $@"
}

# CHORE.
function gchore() {
    gcap "📌 chore: $@"
}


function pj(){
    mkdir -p $1
    cd $1
    git init
    git config --local user.name "lgf-136"
    git config --local user.email "lgf_136@163.com"
    git config --local core.autocrlf false
    # 中文乱码
    git config --local core.quotepath false
    git config --local http.sslVerify false
    git config --local https.sslVerify false
}


#  font
download_font () {
    # url="https://raw.githubusercontent.com/wsdjeg/DotFiles/7a75a186c6db9ad6f02cafba8d4c7bc78f47304c/local/share/fonts/${1// /%20}"
    url="https://gitee.com/lgf1244/omf/blob/master/my_favorite/${1// /%20}"
    path="$HOME/.local/share/fonts/$1"
    # Clean up after https://github.com/SpaceVim/SpaceVim/issues/2532
    if [[ -f "$path" && ! -s "$path" ]]
    then
        rm "$path"
    fi
    if [[ -f "$path" ]]
    then
        info "Downloaded $1"
    else
        info "Downloading $1"
        curl -s -o "$path" "$url"
        info "Downloaded $1"
    fi
}

# }}}

install_fonts () {
    if [[ ! -d "$HOME/.local/share/fonts" ]]; then
        mkdir -p $HOME/.local/share/fonts
    fi
    for i in "$@"
        do
            download_font $i
        done
    # download_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    info "Updating font cache, please wait ..."
    if [ $distribution = "Darwin" ];then
        if [ ! -e "$HOME/Library/Fonts" ];then
            mkdir "$HOME/Library/Fonts"
        fi
        cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
    else
        fc-cache -fv > /dev/null
        mkfontdir "$HOME/.local/share/fonts" > /dev/null
        mkfontscale "$HOME/.local/share/fonts" > /dev/null
    fi
    info "font cache done!"
}