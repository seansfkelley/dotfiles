source "$( cd "$( dirname $0 )" && pwd )"/git-helpers.sh

alias gf='git fetch'
compdef _git gf=git-fetch
alias grb='git rebase'
compdef _git gst=git-rebase
alias gsh='git show'
compdef _git gst=git-show
alias gpn='git push origin $(git rev-parse --abbrev-ref HEAD) -u'
compdef _git gp!=git-push
# clobber existing gc! because I prefer this functionality
alias gc!='git commit -v --amend -C HEAD'
compdef _git gc!=git-commit
# clobber existing gbda because this functionality is more reasonable and safer
alias gbda='git branch --no-color --merged origin/master | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'

alias githlog='git log --date-order --all --graph --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d%Creset%s"'

function gnb() {
  if [ "$#" -lt 1 ]; then
    echo "usage: gnb branch_name"
    return 1
  fi

  local branch_name="$1"
  shift
  git fetch && git checkout -b "$branch_name" origin/master $*
  return $?
}
compdef _git gnb=git-checkout