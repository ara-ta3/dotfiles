let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go', 'python'] }
let g:syntastic_go_checkers = ['golint', 'errcheck', 'govet']

let g:syntastic_python_checkers = ['pyflakes', 'pep8']

"" quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})

"" quickrunのランナーにvimprocを使用する
"" 成功時はバッファへ
"" エラー時はquickfixへ出力
let g:quickrun_config._ = {
            \   'runner'    : 'vimproc',
            \   'runner/vimproc/updatetime' : 60,
            \   'outputter' : 'error',
            \   'outputter/error/success' : 'buffer',
            \   'outputter/error/error'   : 'quickfix',
            \   'outputter/buffer/split'  : ':rightbelow 8sp',
            \   'outputter/buffer/close_on_empty' : 1,
            \}

"let g:quickrun_config["go"] = {
"            \   'command': 'go',
"            \   'cmdopt' : './...',
"            \   'exec': '%c build %o',
"            \   'errorformat': '%f:%l: %m,%-G%.%#',
"            \}
"autocmd BufWritePost *.go :QuickRun go
