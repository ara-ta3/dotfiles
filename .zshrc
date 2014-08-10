[ -f ~/dotfiles/.zshrc.autoload ] && source ~/dotfiles/.zshrc.autoload
[ -f ~/dotfiles/.zshrc.prompt ] && source ~/dotfiles/.zshrc.prompt
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias
[ -f ~/dotfiles/.zshrc.mysql ] && source ~/dotfiles/.zshrc.mysql
[ -f ~/dotfiles/.zshrc.local ] && source ~/dotfiles/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# zstyle
  zstyle ':completion:*' menu select true
# colorstyle (ls)
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>+'
