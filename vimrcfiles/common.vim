" zshの読み込みに時間がかかるためbashに変更
set shell=/bin/bash
set smartindent
set number
set showmatch
set matchtime=1
set display=lastline
set enc=utf-8
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch

" スペース可視化
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:$
set backspace=indent,eol,start

" nnoremap
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap < gT
nnoremap > gt
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap W :<C-u>w<CR>
nnoremap <C-u> :Unite<CR>
nnoremap qq :q<CR>

" imap
imap jj <Esc>
imap <C-a> <Esc>0i

" indent_guides
let g:indent_guides_start_level=1
let g:indent_guides_enable_on_vim_startup=1
