alias a='git add'
alias amend='git commit --amend -C HEAD'
alias b='git branch'
alias c='git commit'
alias co='git checkout'
alias d='git diff'
alias f='git fetch'
alias l='git log'
alias p='git push origin'
alias pick='git cherry-pick'
alias r='git rebase'
alias s='git status'
alias up='git fetch && git rebase'

alias start='git hf feature start'
alias finish='git hf feature finish'
alias update='git hf update'

alias gitdelmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias githlog='git log --date-order --all --graph --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d%Creset%s"'

if [ `which brew 2> /dev/null` ]; then
    source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

    __git_complete a _git_add
    __git_complete amend _git_commit
    __git_complete b _git_branch
    __git_complete c _git_commit
    __git_complete co _git_checkout
    __git_complete d _git_diff
    __git_complete f _git_fetch
    __git_complete l _git_log
    __git_complete p _git_push
    __git_complete pick _git_cherry
    __git_complete r _git_rebase
fi

git-parse-head () {
    hash git 2> /dev/null
    if [ $? -eq 0 ]; then
        ref=`git symbolic-ref HEAD 2> /dev/null`
        if [ ! "$ref" = "" ]; then
            echo `basename $ref`
        fi
    fi
}

git-rm-rejs() {
    git ls-files --other --exclude-standard | xargs rm
}

gitsr() {
    git stash && git rebase $1 && git stash apply
}

gitscd() {
    git stash && git checkout $1 && git stash apply
}

git-changed-files() {
    if [ -z $1 ]; then
        rev=HEAD
    else
        rev=$1
    fi
    git show --pretty="format:" --name-only $1 | tail -n +2
}

git-cherry-pick-with-reject() {
    if [ -z $1 ]; then
        echo "fatal: requires 1 or 2 revisions"
        return
    fi
    if [ -z $2 ]; then
        from=$1~
        to=$1
    else
        from=$1
        to=$2
    fi
    git-changed-files $to |
    while read file;  do
        git diff -w -p $from $to -- "$file" | git apply --reject --ignore-whitespace;
    done
    echo
    echo "make sure to check for binary files and other newly-added untracked files"
}

git-start() {
    if [ -z $1 ]; then
        echo "fatal: requires feature name"
        return
    fi
    git fetch && git checkout -b "feature/$1" origin/master && git push origin -u "feature/$1"
}

git-finish() {
    if [ -z $1 ]; then
        echo "fatal: requires feature name"
        return
    fi
    git fetch && git checkout -q origin/master && git branch -d "feature/$1" && git push origin ":feature/$1"
}
