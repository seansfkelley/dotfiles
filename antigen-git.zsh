antigen bundle git

source "$( cd "$( dirname $0 )" && pwd )"/git-helpers.sh

alias gf='git fetch'
compdef _git gf=git-fetch
alias grb='git rebase'
compdef _git gst=git-rebase
alias gsh='git show'
compdef _git gst=git-show
# clobber existing gc! because I prefer this functionality
alias gc!='git commit -v --amend -C HEAD'
compdef _git gc!=git-commit

alias githlog='git log --date-order --all --graph --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d%Creset%s"'
