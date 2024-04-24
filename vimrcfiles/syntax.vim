augroup go
    autocmd!
    autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

augroup scala
    autocmd!
    autocmd FileType scala set dictionary=~/dotfiles/.vim/dictionary/scala.dict
    autocmd FileType scala set wildignore+=*/target/*
    autocmd FileType sbt.scala set filetype=sbt
augroup END

if filereadable(expand('$HOME/dotfiles/vimrcfiles/syntax/scala.vimrc'))
    source $HOME/dotfiles/vimrcfiles/syntax/scala.vimrc
endif

augroup markdown
    autocmd!
    autocmd FileType md set filetype=markdown
augroup END

syntax on
