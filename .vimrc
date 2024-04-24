source $HOME/dotfiles/vimrcfiles/common.vim
source $HOME/dotfiles/vimrcfiles/dein.vim
source $HOME/dotfiles/vimrcfiles/colors.vim
source $HOME/dotfiles/vimrcfiles/syntax.vim
source $HOME/dotfiles/vimrcfiles/ddc.vim
source $HOME/dotfiles/vimrcfiles/lsp.vim
source $HOME/dotfiles/vimrcfiles/fmt.vim

if filereadable(expand('$HOME/.vimrc.local'))
    source $HOME/.vimrc.local
endif
