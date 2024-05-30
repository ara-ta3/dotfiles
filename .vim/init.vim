
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
  source $HOME/dotfiles/vimrcfiles/deinlist.vim
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


