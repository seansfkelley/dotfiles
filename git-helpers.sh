alias gn='nocorrect git number --column'
alias gh='open $(git remote get-url origin | sed -Ee '"'"'s#(git@|git://)#https://#'"'"' -e '"'"'s@:([^:]+).git$@/\1@'"'"')'
alias ghpr='git push origin HEAD -u && open https://github.com/$(git ls-remote --get-url origin | sed -E -e "s/^.+:(.+)\.git$/\1/")/compare/master...$(git rev-parse --abbrev-ref HEAD)'
