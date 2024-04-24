" Use sbdchd/neoformat
let g:neoformat_try_node_exe = 1

let g:auto_fmt_enabled = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * if g:auto_fmt_enabled | undojoin | Neoformat | endif
augroup END

let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']

