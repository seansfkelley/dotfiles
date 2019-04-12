alias inv='poetry run inv'
alias flask='poetry run flask'
alias act=$'source "$(poetry debug:info | rg \'.*Path:[^/]+(.*)\' -r \'$1\')/bin/activate"'
