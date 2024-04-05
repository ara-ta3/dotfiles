au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Space><Enter> :GoRun<CR>

set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
au FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
