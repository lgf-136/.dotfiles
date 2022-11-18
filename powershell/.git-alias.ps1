
# git operate
Function gcl($git_url='', $target=''){
    git clone --depth=1 `
        -c core.eol=lf `
        -c core.autocrlf=false `
        -c fsck.zeroPaddedFilemode=ignore `
        -c fetch.fsck.zeroPaddedFilemode=ignore `
        -c receive.fsck.zeroPaddedFilemode=ignore `
        $git_url $target
}

Function gpcl($git_url='', $target=''){
    git clone --depth=1 `
        -c core.eol=lf `
        -c core.autocrlf=false `
        -c fsck.zeroPaddedFilemode=ignore `
        -c fetch.fsck.zeroPaddedFilemode=ignore `
        -c receive.fsck.zeroPaddedFilemode=ignore `
        http://gitproxy.ml/$git_url $target
}

# git log

Function glg(){
    git log --graph --oneline --all
}
# git emojis
function gcap() {
    # BUG:  标记“&&”不是此版本中的有效语句分隔符。
    # git add . && git commit -m "$*" && git push
    git add . ; git commit -m "$args" ; git push
}
# FEAT.
function gfeat() {
    gcap "✏️ feat: $args"
}
# IMPROVE.
function gimp() {
    gcap "📈 improve: $args"
}
# FIX.
function gfix() {
    gcap "🔧 fix: $args"
}
# RELEASE.
function grls() {
    gcap "🚀 release: $args"
}
# DOC.
function gdoc() {
    gcap "📑 doc: $args"
}
# TEST.
function gtst() {
    gcap "✅ test: $args"
}
# CHORE.
function gchore() {
    gcap "📌 chore: $args"
}



