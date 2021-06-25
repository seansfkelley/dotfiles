# what the fuck tmuxinator
# https://discourse.brew.sh/t/why-does-tmuxinator-sets-gem-home/7296/3
unset -v GEM_HOME

# antigen
source <path_to_antigen.zsh>
source <path_to_shell_setup>/meta.zsh
source <path_to_shell_setup>/antigen-bundles.zsh
antigen apply
source <path_to_shell_setup>/antigen-theme.zsh
source <path_to_shell_setup>/specifics.zsh
