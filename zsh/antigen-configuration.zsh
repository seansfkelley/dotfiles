antigen bundle andrewferrier/fzf-z

# this has to come after, since `use` sets the default and we rely on it later for the theme and stuff
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle tmuxinator
antigen bundle osx
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle z
antigen theme simple

antigen apply

# what the shit https://github.com/zsh-users/antigen/issues/676
antigen bundle git
