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

" nnoremap
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap < gT
nnoremap > gt
nnoremap <C-e> :NERDTreeToggle<CR>

" imap
imap jj <Esc>

" 補完
" phpの補完
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set dictionary=~/dotfiles/.vim/dictionary/PHP.dict
" scalaの補完
autocmd FileType scala set dictionary=~/dotfiles/.vim/dictionary/scala.dict

"Color
colorscheme elflord 

"Twigのシンタックス
au BufRead,BufNewFile *.twig set syntax=htmldjango
syntax on

"Alingtaの初期設定
let b:alignta_default_arguments='01'
let g:alignta_default_arguments='01'


" 補完ウィンドウの設定
set completeopt=menuone
"neocomplcache有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/dotfiles/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/dotfiles/.vim/dict/php.dict'
        \ }
" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"<C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()


"php-doc 
"/*
" *
"*/
"を追加する plugin
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" ref vim phpの設定
let g:ref_phpmanual_path = $HOME."dotfiles/.vim/doc/php/php-chunked-xhtml"
let g:ref_use_vimproc = 0 

" スペース可視化
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" Bundleの設定
" @see also http://qiita.com/1987yama3/items/1caa0e167912a51ae9cc
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
" My Bundles here:
"
" original repos on github
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'ref.vim'
Plugin 'EnhCommentify.vim'
Plugin 'aharisu/vim_goshrepl'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'evidens/vim-twig'

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"            \ "\<Plug>(neosnippet_expand_or_jump)"
"            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" " For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

call pathogen#infect()

set backspace=indent,eol,start
