export EDITOR='code --wait'

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

# kinda neat but realistically probably never used when I'm searching via my editor
# https://news.ycombinator.com/item?id=38474106
function frg {
  result=$(rg --ignore-case --color=always --line-number --no-heading "$@" |
    fzf --ansi \
        --color 'hl:-1:underline,hl+:-1:underline:reverse' \
        --delimiter ':' \
        --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')
  file=${result%%:*}
  linenumber=$(echo "${result}" | cut -d: -f2)
  if [[ -n "$file" ]]; then
    # $EDITOR +"$linenumber" "$file"
    code --wait -g "$file:$linenumber"
  fi
}
