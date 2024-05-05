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
    if $VIM_COLOR == "molokai"
        call s:color_molokai()
    elseif $VIM_COLOR == "lucariox"
        call s:color_lucariox()
    endif
catch
    echo "color scheme is not installed"
endtry
