alias t='t_time_tracker'
alias b='afplay /System/Library/Sounds/Glass.aiff -v 2'
alias n='osascript -e "display notification with title \"Task Finished\""'
alias jsonpretty='python -m json.tool'

function f() {
  find . -iname "*$1*"
}

function bulk-rename() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: bulk-rename <search-path> <from-ext> <to-ext>"
    return 1
  fi

  find $1 -type f -name "*$2" -exec sh -c 'mv "$1" "${1%'$2'}'$3'"' _ {} \;
}
