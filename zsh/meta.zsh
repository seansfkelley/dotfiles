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
  else
    echo 'Aborting!'
  fi
  popd
}
