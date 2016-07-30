if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.common'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.common
endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/dein.vimrc'))
    source $HOME/dotfiles/vimrcfiles/dein.vimrc
    if filereadable(expand('$HOME/dotfiles/vimrcfiles/dein.detail.vimrc'))
        source $HOME/dotfiles/vimrcfiles/dein.detail.vimrc
    endif

    if filereadable(expand('$HOME/dotfiles/vimrcfiles/plugins/vimrc.git'))
        source $HOME/dotfiles/vimrcfiles/plugins/vimrc.git
    endif
endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.colors'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.colors
endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.syntax'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.syntax
endif
