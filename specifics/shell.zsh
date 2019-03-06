export EDITOR=/usr/bin/emacs

alias ....='cd ../../..'
alias .....='cd ../../../..'

function f() {
  find . -iname "*$1*"
}

function mv-ext() {
  if [ "$#" -ne 3 ]; then
    echo "usage: mv-ext <search-path> <from-ext> <to-ext>"
    return 1
  fi

  find $1 -type f -name "*$2" -exec sh -c 'mv "$1" "${1%'$2'}'$3'"' _ {} \;
}

alias jsonpretty='python -m json.tool'
