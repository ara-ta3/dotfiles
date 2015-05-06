if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.common'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.common
endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.plugin'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.plugin
    if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.plugin.detail'))
        source $HOME/dotfiles/vimrcfiles/.vimrc.plugin.detail
    endif

    if filereadable(expand('$HOME/dotfiles/vimrcfiles/plugins/vimrc.neocomplete'))
        source $HOME/dotfiles/vimrcfiles/plugins/vimrc.neocomplete
    endif

    if filereadable(expand('$HOME/dotfiles/vimrcfiles/plugins/vimrc.git'))
        source $HOME/dotfiles/vimrcfiles/plugins/vimrc.git
    endif

    if filereadable(expand('$HOME/dotfiles/vimrcfiles/plugins/vimrc.pathogen'))
        source $HOME/dotfiles/vimrcfiles/plugins/vimrc.pathogen
    endif

endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.colors'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.colors
endif

if filereadable(expand('$HOME/dotfiles/vimrcfiles/.vimrc.syntax'))
    source $HOME/dotfiles/vimrcfiles/.vimrc.syntax
endif

if filereadable(expand('$HOME/dotfiles/mac/mac.vimrc'))
    source $HOME/dotfiles/mac/mac.vimrc
endif

