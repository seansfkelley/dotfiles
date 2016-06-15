antigen theme simple

declare ENABLE_DIRTY_GIT_PROMPT=true

# Stolen and adapted from
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
function git_prompt_info_no_dirty() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_git_prompt_info() {
  if ( test $ENABLE_DIRTY_GIT_PROMPT = true ); then
    git_prompt_info
  else
    git_prompt_info_no_dirty
  fi
}

PROMPT='%{$fg[yellow]%}%~
%{$fg[blue]%}[%*] %{$fg[white]%}$(get_git_prompt_info)%{$reset_color%}⟩ '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}-"
