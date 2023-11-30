alias gn='nocorrect git number --column'
alias gh='open $(git remote get-url origin | sed -Ee '"'"'s#(git@|git://)#https://#'"'"' -e '"'"'s@:([^:]+).git$@/\1@'"'"')'
alias ghpr='git push origin HEAD -u && open "https://github.com/$(git ls-remote --get-url origin | sed -E -e "s/^.+:(.+)\.git$/\1/")/pull/new/$(git rev-parse --abbrev-ref HEAD)"'
alias githlog='git log --date-order --graph --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset%C(red bold)%d%Creset %s"'

alias gpn='git push origin $(git rev-parse --abbrev-ref HEAD) -u'
compdef _git gpn=git-push
# clobber existing gc! because I prefer this functionality
alias gc!='git commit -v --amend -C HEAD'
compdef _git gc!=git-commit
# clobber existing gbda because this functionality is more reasonable and safer
alias gbda='git branch --no-color --merged "origin/${GIT_MAIN_BRANCH:-master}" | command grep -vE "^(\*|\+|\s*(master|develop|dev|main)\s*$)" | command xargs -n 1 git branch -d'
alias gbd!='git branch -D'
# clobber existing gr because I never use `git remote`
alias gr='git reset'
alias gcom='git fetch && git checkout "origin/${GIT_MAIN_BRANCH:-master}"'
alias gmm='git fetch && git merge "origin/${GIT_MAIN_BRANCH:-master}"'
alias grbm='git fetch && git rebase "origin/${GIT_MAIN_BRANCH:-master}"'
alias gfza='git fuzzy-add'

function gnb() {
  if [ "$#" -lt 1 ]; then
    echo "usage: gnb branch_name"
    return 1
  fi

  local branch_name="$1"
  shift
  git fetch && git checkout -b "$branch_name" "origin/${GIT_MAIN_BRANCH:-master}" $*
  return $?
}
compdef _git gnb=git-checkout
