set t_Co=256

function! s:color_molokai()
    let g:molokai_original = 1
    set background=dark
    colorscheme molokai
endfunction

function! s:color_lucariox()
    colorscheme lucariox
endfunction


try
    call s:color_molokai()
catch
    echo "color scheme is not installed"
endtry
