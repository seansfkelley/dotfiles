function use_alternate() {
  old="$1"
  new="$2"
  shift 2

  if [ $(command -v "$new") ]; then
    read "answer?can't $old, use $new instead? Y/n "
    if [[ "$answer" == "" ]] || [[ "$answer" =~ '^[Yy]$' ]]; then
      "$new" "$@"
    else
      return 1
    fi
  else
    "$old" "$@"
  fi
}

alias cat='use_alternate cat bat'
alias ls='use_alternate ls exa'
alias du='use_alternate du dust'
alias tree='use_alternate tree broot'
alias find='use_alternate find fd'
alias cut='use_alternate cut choose'
alias top='use_alternate top htop'
alias ping='use_alternate ping gping'
alias ps='use_alternate ps procs'

function man() {
  if [ $(command -v cheat) ]; then
    read "answer?want to cheat instead? y/N "
    if [[ "$answer" == "" ]] || [[ "$answer" =~ '^[Nn]$' ]]; then
      /usr/bin/man "$@"
    else
      cheat "$@"
    fi
  else
    /usr/bin/man "$@"
  fi
}
