export NVM_DIR="$HOME/.nvm"

# adapted from https://mijndertstuij.nl/posts/life-is-too-short-for-a-slow-terminal/
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}
