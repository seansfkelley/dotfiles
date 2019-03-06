export SHELL=/usr/local/bin/zsh
export PATH=/usr/local/bin:$PATH

source <path_to_shell_setup>/meta.zsh
source <path_to_shell_setup>/antigen-bundles.zsh
antigen apply
source <path_to_shell_setup>/antigen-theme.zsh
source <path_to_shell_setup>/specifics.zsh
