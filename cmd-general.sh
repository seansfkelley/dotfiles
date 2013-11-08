alias ls='ls -G'
# Typos.
alias dc='cd'
alias sl='ls'

exp-repl() {
    while [ $# -gt 0 ]; do
        expand -t 4 $1 > /tmp/exp-repl-tmp && mv /tmp/exp-repl-tmp $1
        shift
    done
}

# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

_blue_="\[\e[34;1m\]"
_black_="\[\e[30;1m\]"
_gray_="\[\e[37;1m\]"
_cyan_="\[\e[36;1m\]"
_green_="\[\e[32;1m\]"
_yellow_="\[\e[1;33;1m\]"
_no_color_="\[\e[0m\]"
