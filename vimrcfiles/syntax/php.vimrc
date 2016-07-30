autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set dictionary=~/.vim/dictionary/PHP.dict
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
