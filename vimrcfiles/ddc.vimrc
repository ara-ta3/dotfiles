call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'],
            \ },
            \ 'vim-lsp': {
            \   'mark': 'LSP',
            \   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
            \   'isVolatile': v:true,
            \   'minAutoCompleteLength': 1,
            \ }
            \ })
call ddc#custom#patch_global('ui', 'pum')
"call ddc#custom#patch_global(#{
"        \   ui: 'pum',
"        \   autoCompleteEvents: [
"        \     'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
"        \   ],
"        \   cmdlineSources: {
"        \     ':': ['cmdline', 'cmdline-history', 'around']
"        \   },
"        \ })
call ddc#enable()

inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <Enter> <Cmd>call pum#map#confirm()<CR>
