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
