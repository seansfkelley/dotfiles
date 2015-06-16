export EDITOR=/usr/bin/emacs
export JAVA_7_HOME=$(/usr/libexec/java_home -F -v1.7)
export JAVA_8_HOME=$(/usr/libexec/java_home -F -v1.8)
export JAVA_HOME=${JAVA_7_HOME}

SHELL_SETUP="$( cd "$( dirname $0 )" && pwd )"

alias settings="subl; subl ~/.zshrc $SHELL_SETUP/*.{sh,zsh}"

alias ....='cd ../../..'
alias .....='cd ../../../..'
