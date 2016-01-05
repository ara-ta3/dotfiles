[ -f ~/dotfiles/.zshrc.autoload ] && source ~/dotfiles/.zshrc.autoload
[ -f ~/dotfiles/zshrcfiles/zshrc.bindkey ] && source ~/dotfiles/zshrcfiles/zshrc.bindkey
[ -f ~/dotfiles/.zshrc.prompt ] && source ~/dotfiles/.zshrc.prompt
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias
[ -f ~/dotfiles/.zshrc.mysql ] && source ~/dotfiles/.zshrc.mysql
[ -f ~/dotfiles/zshrc.npm.completion ] && source ~/dotfiles/zshrc.npm.completion
[ -f ~/dotfiles/zshrc.func ] && source ~/dotfiles/zshrc.func
[ -f ~/dotfiles/zshrc.peco ] && source ~/dotfiles/zshrc.peco
[ -f ~/dotfiles/.zshrc.local ] && source ~/dotfiles/.zshrc.local
[ -f ~/dotfiles/.zshrc.autoload ] && source ~/dotfiles/zshrcfiles/zshrc.zplug
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# zstyle
zstyle ':completion:*' menu select true
# colorstyle (ls)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

fpath=($HOME/.zsh.d/zsh-completions/src $fpath)

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>+'
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
