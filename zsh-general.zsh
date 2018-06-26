export EDITOR=/usr/bin/emacs
export JAVA_9_HOME=$(/usr/libexec/java_home -F -v1.9 2&>/dev/null)
export JAVA_HOME=${JAVA_9_HOME}

SHELL_SETUP="$( cd "$( dirname $0 )" && pwd )"

alias settings="subl; subl ~/.zshrc $SHELL_SETUP/*.{sh,zsh}"

alias ....='cd ../../..'
alias .....='cd ../../../..'
