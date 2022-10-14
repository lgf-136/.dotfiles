#alias la='ls -lah'
#if [ -t 1 ]; then
#  exec zsh
#fi
export LANG=en_US.UTF-8
# You don't strictly need this collation, but most technical people
# probably want C collation for sane results
export LC_COLLATE=C
source ~/.alias.sh
source ~/.exports.sh
source ~/.functions.sh

exec zsh
