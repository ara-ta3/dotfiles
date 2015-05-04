autocmd BufRead,BufNewFile,BufReadPre *.conf set filetype=conf
autocmd BufRead,BufNewFile,BufReadPre mongo*.conf set filetype=yaml

autocmd FileType conf set shiftwidth=2
