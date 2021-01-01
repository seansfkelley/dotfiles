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

# This only works because it runs before the git things, which would change the exit code.
function get_last_command_exit_code_prompt_info() {
  if ( test $? = 0 ); then
    echo "%{$fg[white]%}-%{$reset_color%}"
  else
    echo "%{$fg[red]%}!%{$reset_color%}"
  fi
}

function maybe_run_passprompt() {
  # https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
  if command -v passprompt &> /dev/null
  then
      passprompt ask
  fi
}

# Note that passprompt is in the middle so that it doesn't affect the last command prompt exit code.
PROMPT='%{$fg[yellow]%}%~
$(get_last_command_exit_code_prompt_info) $(maybe_run_passprompt)%{$fg[blue]%}[%*] %{$fg[white]%}$(get_git_prompt_info)%{$reset_color%}⟩ '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}-"
