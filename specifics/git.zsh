alias gn='nocorrect git number --column'
alias gh='open $(git remote get-url origin | sed -Ee '"'"'s#(git@|git://)#https://#'"'"' -e '"'"'s@:([^:]+).git$@/\1@'"'"')'
alias ghpr='git push origin HEAD -u && open https://github.com/$(git ls-remote --get-url origin | sed -E -e "s/^.+:(.+)\.git$/\1/")/compare/master...$(git rev-parse --abbrev-ref HEAD)'
alias githlog='git log --date-order --all --graph --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d%Creset%s"'

alias grb='git rebase'
compdef _git grb=git-rebase
alias gsh='git show'
compdef _git gsh=git-show
alias gpn='git push origin $(git rev-parse --abbrev-ref HEAD) -u'
compdef _git gpn=git-push
# clobber existing gc! because I prefer this functionality
alias gc!='git commit -v --amend -C HEAD'
compdef _git gc!=git-commit
# clobber existing gbda because this functionality is more reasonable and safer
alias gbda='git branch --no-color --merged origin/master | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
# clobber existing gap because I never use apply
alias gap='git -c "interactive.diffFilter=less" add -p'
alias gcom='git fetch && git checkout origin/master'

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
