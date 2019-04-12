export EDITOR=emacs

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

function notify() {
	"$@"
	exit_code="$?"
	if [ "$exit_code" -eq 0 ]; then
		terminal-notifier -title "task success"  -message '' -sound Pop
	else
		terminal-notifier -title "task failure"  -message '' -sound Pop
	fi
	return $exit_code
}

alias jsonpretty='python -m json.tool'
