" Use sbdchd/neoformat
let g:neoformat_try_node_exe = 1

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


