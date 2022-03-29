DOTFILES="$(cd "$(dirname "$0")" && cd .. && pwd)"
alias settings="code ~/.zshrc ~/.zprofile $DOTFILES/zsh/**/*.zsh"
