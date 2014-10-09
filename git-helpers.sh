git-feature() {
    if [ -z $1 ]; then
        echo "fatal: requires feature name"
        return
    fi
    git fetch && git checkout -b "feature/$1" origin/develop && git push origin -u "feature/$1" --no-verify
}

git-feature-finish() {
    if [ -z $1 ]; then
        echo "fatal: requires feature name"
        return
    fi
    git fetch && git checkout -q origin/develop && git branch -d "feature/$1" && git push origin ":feature/$1"  --no-verify
}

git-bugfix() {
    if [ -z $1 ]; then
        echo "fatal: requires bugfix name"
        return
    fi
    git fetch && git checkout -b "bugfix/$1" origin/develop && git push origin -u "bugfix/$1"  --no-verify
}

git-bugfix-finish() {
    if [ -z $1 ]; then
        echo "fatal: requires bugfix name"
        return
    fi
    git fetch && git checkout -q origin/develop && git branch -d "bugfix/$1" && git push origin ":bugfix/$1"  --no-verify
}