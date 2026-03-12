setopt auto_pushd
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt correct
setopt cdable_vars
setopt extended_history
setopt hist_ignore_dups
setopt no_beep
setopt nolistbeep
setopt print_eight_bit
setopt print_exit_value
setopt pushd_ignore_dups
function set_tab_title() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
    print -Pn "\e]1;$branch\a"
  else
    print -Pn "\e]1;%2~\a"
  fi
}
precmd_functions+=(set_tab_title)

source ~/dotfiles/zshrcfiles/zshrc.alias
source ~/dotfiles/zshrcfiles/zshrc.zplug
source ~/dotfiles/zshrcfiles/zshrc.completion
source ~/dotfiles/zshrcfiles/zshrc.bindkey
source ~/dotfiles/zshrcfiles/zshrc.prompt
source ~/dotfiles/zshrcfiles/zshrc.func

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export WORDCHARS='*?.[]~&;!#$%^(){}<>+'
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
export EDITOR=vim
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
