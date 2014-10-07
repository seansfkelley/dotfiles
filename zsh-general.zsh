export EDITOR=/usr/bin/emacs
export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home)

SHELL_SETUP="$( cd "$( dirname $0 )" && pwd )"

alias settings="subl; subl ~/.zshrc $SHELL_SETUP/*.{sh,zsh}"

alias ....='cd ../../..'
alias .....='cd ../../../..'
