
let s:dein_dir = expand('~/.config/dein.nvim')

if !($dein_dir->isdirectory())
  call mkdir($dein_dir, 'p')
endif
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:rc_dir = expand('~/.vim')

if !s:dein_repo_dir->isdirectory()
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('miconda/lucariox.vim')
  call dein#add('tomasr/molokai')

  " fmt
  call dein#add('sbdchd/neoformat')


  " other plugins <- TODO
  call dein#add('scrooloose/nerdtree')
  call dein#add('mattn/emmet-vim')
  call dein#add('vim-scripts/vim-niji')
  call dein#add('scrooloose/syntastic')
  call dein#add('Shougo/unite.vim')
  call dein#add('vim-scripts/EnhCommentify.vim')
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('qpkorr/vim-renamer')
  call dein#add('preservim/vim-indent-guides')

  # previm
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')

  " syntax
  call dein#add('hashivim/vim-terraform')
  call dein#add('rcmdnk/vim-markdown')

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
  call dein#save_state()
endif

" automatically install any plug-ins that need to be installed.
if dein#check_install()
    call dein#install()
endif

source $HOME/dotfiles/vimrcfiles/common.vim
source $HOME/dotfiles/vimrcfiles/colors.vim
source $HOME/dotfiles/vimrcfiles/syntax.vim
source $HOME/dotfiles/vimrcfiles/ddc.vim
source $HOME/dotfiles/vimrcfiles/lsp.vim
source $HOME/dotfiles/vimrcfiles/fmt.vim


