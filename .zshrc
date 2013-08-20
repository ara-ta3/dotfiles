[ -f .zshrc.autoload ] && source .zshrc.autoload
[ -f .zshrc.prompt ] && source .zshrc.prompt
[ -f .zshrc.alias ] && source .zshrc.alias
[ -f .zshrc.mysql ] && source .zshrc.mysql
[ -f .zshrc.local ] && source .zshrc.local

# zstyle
 zstyle ':completion:*' menu select true
# directory = blue, symbolic link = magenta
 zstyle ':completion:*' list-colors 'di=34;49' 'ln=35;49'
# colorstyle (ls)
LS_COLORS="di=34;49:ln=35;49"
