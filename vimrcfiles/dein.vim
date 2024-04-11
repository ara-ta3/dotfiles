if &compatible
    set nocompatible
endif
let s:dein_base = '~/.config/dein.vim'
let s:dein_src = '~/.config/dein.vim/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src
call dein#begin(s:dein_base)
call dein#add(s:dein_src)
" color schemes
call dein#add('tomasr/molokai')
call dein#add('miconda/lucariox.vim')

" other plugins <- TODO
call dein#add('scrooloose/nerdtree')
call dein#add('mattn/emmet-vim')
call dein#add('vim-scripts/vim-niji')
call dein#add('scrooloose/syntastic')
call dein#add('Shougo/unite.vim')
call dein#add('vim-scripts/EnhCommentify.vim')
call dein#add('h1mesuke/vim-alignta')
call dein#add('rcmdnk/vim-markdown')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('qpkorr/vim-renamer')
call dein#add('kannokanno/previm')
call dein#add('preservim/vim-indent-guides')

" ddc
call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('Shougo/ddc-ui-pum')
call dein#add('Shougo/pum.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('shun/ddc-source-vim-lsp')
call dein#add('LumaKernel/ddc-file')
call dein#add('Shougo/ddc-converter_remove_overlap')
call dein#end()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif
