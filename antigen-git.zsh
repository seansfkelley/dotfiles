antigen bundle git

alias gf='git fetch'
compdef _git gf=git-fetch
alias grb='git rebase'
compdef _git gst=git-rebase
alias gsh='git show'
compdef _git gst=git-show
# clobber existing gc! because I prefer this functionality
alias gc!='git commit -v --amend -C HEAD'
compdef _git gc!=git-commit
