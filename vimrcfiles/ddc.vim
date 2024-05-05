call ddc#custom#patch_global('sources', ['around', 'file', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'],
            \   'converters': ['converter_remove_overlap'],
            \ },
            \ 'around': {
            \   'mark': 'A',
            \   'minAutoCompleteLength': 1,
            \ },
            \ 'file': {
            \   'mark': 'F',
            \   'minAutoCompleteLength': 1,
            \   'forceCompletionPattern': '\S/\S*',
            \ },
            \ 'vim-lsp': {
            \   'mark': 'LSP',
            \   'minAutoCompleteLength': 1,
            \   'forceCompletionPattern': '\.|:|->|"\w+/*|\S'
            \ }
            \ })
call ddc#custom#patch_global(#{
        \   ui: 'pum',
        \   autoCompleteEvents: [
        \     'InsertEnter', 'TextChangedI', 'TextChangedP',
        \   ],
        \ })
call ddc#enable()

inoremap <expr> <CR> pum#visible() ? "\<Cmd>call pum#map#confirm()<CR>" : "\<CR>"
inoremap <expr> <Tab> pum#visible() ? "\<Cmd>call pum#map#insert_relative(+1)\<CR>" : "\<Tab>"
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
