setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt no_beep
setopt nolistbeep
setopt hist_ignore_dups
setopt auto_list
setopt auto_menu
setopt print_eight_bit
setopt pushd_ignore_dups
setopt extended_history
setopt print_exit_value

source ~/dotfiles/zshrcfiles/zshrc.alias
source ~/dotfiles/zshrcfiles/zshrc.zplug
source ~/dotfiles/zshrcfiles/zshrc.completion
source ~/dotfiles/zshrcfiles/zshrc.bindkey
source ~/dotfiles/zshrcfiles/zshrc.prompt
source ~/dotfiles/zshrcfiles/zshrc.func
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>+'
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
export EDITOR=vim

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh
