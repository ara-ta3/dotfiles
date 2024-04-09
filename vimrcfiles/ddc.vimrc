call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'],
            \ },
            \ 'around': {
            \   'mark': 'A',
            \   'minAutoCompleteLength': 1,
            \ },
            \ 'vim-lsp': {
            \   'mark': 'LSP',
            \   'minAutoCompleteLength': 1,
            \ }
            \ })
call ddc#custom#patch_global(#{
        \   ui: 'pum',
        \   autoCompleteEvents: [
        \     'InsertEnter', 'TextChangedI', 'TextChangedP',
        \   ],
        \ })
call ddc#enable()

inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
