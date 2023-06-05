# These are sort of redundant with fzf's defaults, but ^R seems to not override shell default.
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget

# These must be `export`ed for reasons that escape me.
export FZF_DEFAULT_COMMAND='rg --files --hidden || true'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden" # fd respects ignores; but we DO want to include non-ignored hiddens
