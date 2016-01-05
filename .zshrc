zstyle ':completion:*' menu select true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
fpath=($HOME/.zsh.d/zsh-completions/src $fpath)
autoload -U colors
colors
autoload -U compinit
compinit
autoload -U predict-on
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt PUSHD_IGNORE_DUPS
setopt AUTO_PUSHD
setopt no_beep
setopt nolistbeep

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

alias ls="ls -G"
alias l="ls"
alias ll="ls -hl"
alias la="ls -A"
alias al="ls -A"
alias lla="ls -Al"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias grep="grep --color"
alias gch='git checkout'
alias ga='git add'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias git-get="ghq get"
alias -g p='|peco'
alias -g gr='|xargs grep --color'

[ -f ~/dotfiles/zshrcfiles/zshrc.bindkey ] && source ~/dotfiles/zshrcfiles/zshrc.bindkey
[ -f ~/dotfiles/zshrcfiles/zshrc.prompt ] && source ~/dotfiles/zshrcfiles/zshrc.prompt
[ -f ~/dotfiles/zshrc.npm.completion ] && source ~/dotfiles/zshrc.npm.completion
[ -f ~/dotfiles/zshrc.func ] && source ~/dotfiles/zshrc.func
[ -f ~/dotfiles/zshrcfiles/zshrc.zplug ] && source ~/dotfiles/zshrcfiles/zshrc.zplug
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

