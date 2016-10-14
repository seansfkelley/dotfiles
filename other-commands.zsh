alias t='t_time_tracker'
alias b='afplay /System/Library/Sounds/Glass.aiff -v 2'
alias n='osascript -e "display notification with title \"Task Finished\""'
alias jsonpretty='python -m json.tool'
alias gimme-usrlocal='sudo chown -R skelley /usr/local/{lib,bin,share}'
alias fuck-carbonblack='ps aux | grep CbOsxSensorService | grep CarbonBlack | sed -E "s/ +/ /g" | cut -d " " -f 2 | sudo xargs kill -9'

function f() {
  find . -iname "*$1*"
}

function npmtsd() {
  npm "$@" && tsd "$@"
}

function vscode () {
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
}
