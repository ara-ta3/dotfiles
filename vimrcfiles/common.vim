" zshの読み込みに時間がかかるためbashに変更
set shell=/bin/bash
" 新しい行を作った時に高度な自動インデントを行う 
set smartindent 
"行番号を表示する 
set number

"set nocompatible
set showmatch
set enc=utf-8
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set hlsearch

" スペース可視化
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
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

" コマンドラインモード

" imap
imap jj <Esc>
imap <C-a> <Esc>0i

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
