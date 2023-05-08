# These are sort of redundant with fzf's defaults, but ^R seems to not override shell default.
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget
# TODO: why does alt-C include things from node-modules?

# These must be `export`ed for reasons that escape me.
export FZF_DEFAULT_COMMAND='rg --files --hidden || true'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
