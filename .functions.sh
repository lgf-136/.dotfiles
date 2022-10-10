#! /bin/sh

. ~/.common.sh

os_platform(){
    info "current os platform is $distribution"
}

#.# Better Git Logs.
# https://cubox.pro/my/card?id=ff8080818381afe80183baad56c02b2b
### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).

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