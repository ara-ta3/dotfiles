" ctrlp
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'

" python syntax
let python_highlight_all = 1

" syntastic

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet']

" QuickRun
let g:quickrun_config = {
            \   "_" : {
            \       "outputter/buffer/split" : ":botright",
            \       "outputter/buffer/close_on_empty" : 1
            \   },
            \}

" Alingtaの初期設定
let b:alignta_default_arguments='01'
let g:alignta_default_arguments='01'

" php-doc

let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_Author = "a-tanaka"
let g:pdv_cfg_License = ""
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" ref vim phpの設定
let g:ref_phpmanual_path = $HOME."dotfiles/.vim/doc/php/php-chunked-xhtml"
let g:ref_use_vimproc = 0 

"let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
vmap <CR> <Plug>(gosh_repl_send_block)

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

let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_Author = "Arata Tanaka"
let g:pdv_cfg_License = ""

" vim-tags

let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
set tags+=.tags

" multiple cursors

" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
"
" Ctrl-p in Visual mode will remove the current virtual cursor and go back to the previous virtual cursor location. This is useful if you are trigger happy with Ctrl-n and accidentally went too far.
" Ctrl-x in Visual mode will remove the current virtual cursor and skip to the next virtual cursor location. This is useful if you don't want the current selection to be a candidate to operate on later.
