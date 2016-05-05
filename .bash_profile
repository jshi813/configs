export PATH="$HOME/arcanist/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
source /path/to/arcanist/resources/shell/bash-completion
cd /Users/jshi/foursquare.web
alias g="git grep -n"
alias ca="git commit --amend"
alias gd="git diff-tree --no-commit-id --name-only -r"
alias gen="./python scripts/codetools/bag_tool.py --gen all && git fixlint && ./pants buildgen"
alias dev="ssh -A dev-jshi"
alias l="ls -l"
alias web="./fs web --flc-debug --flc=pants"
alias cor="cordova run browser"
alias web1="./fs web --flc-debug --flc=pants --extra=-Drelease.datetime=`date +%s`"
alias f="find . -name"
