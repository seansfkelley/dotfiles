export EDITOR=emacs

alias ....='cd ../../..'
alias .....='cd ../../../..'
alias reload="exec -l $SHELL"

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
