DOTFILES="$(cd "$(dirname "$0")" && cd .. && pwd)"
alias dotfiles="code $DOTFILES ~/.zshrc ~/.zprofile"

function push-dotfiles() {
  pushd "$DOTFILES"
  git add .
  git diff --cached
  echo -n 'Look good? (y/N) '
  read response
  if [[ "$response" =~ "^(y|Y|yes)$" ]]; then
    echo -n 'Message? (optional) '
    read message
    git commit -m "${message:-Updating dotfiles.}"
    git push origin HEAD:master
    popd
  else
    git reset
    echo -n 'Want to stick around and do it by hand? (Y/n) '
    read response
    if [[ "$response" =~ "^(n|N|no)$" ]]; then
      echo 'Aborting!'
      popd
    else
      echo "popd when you're done!"
    fi
  fi
}

function pull-dotfiles() {
  pushd "$DOTFILES"
  git reset
  git stash
  git pull
  git stash pop
  popd
}
