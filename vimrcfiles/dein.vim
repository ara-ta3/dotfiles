if &compatible
    set nocompatible
endif
let s:dein_base = '~/.config/dein.vim'
let s:dein_src = '~/.config/dein.vim/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src
call dein#begin(s:dein_base)
call dein#add(s:dein_src)
source $HOME/dotfiles/vimrcfiles/deinlist.vim
call dein#end()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif
