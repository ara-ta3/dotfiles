[ -f ~/dotfiles/.zshrc.autoload ] && source ~/dotfiles/.zshrc.autoload
[ -f ~/dotfiles/.zshrc.prompt ] && source ~/dotfiles/.zshrc.prompt
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias
[ -f ~/dotfiles/.zshrc.mysql ] && source ~/dotfiles/.zshrc.mysql
[ -f ~/dotfiles/zshrc.func ] && source ~/dotfiles/zshrc.func
[ -f ~/dotfiles/.zshrc.local ] && source ~/dotfiles/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# zstyle
zstyle ':completion:*' menu select true
# colorstyle (ls)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

export WORDCHARS='*?_-.[]~&;!#$%^(){}<>+'
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
