call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ 'vim-lsp': {
            \   'matchers': ['matcher_head'],
            \   'mark': 'lsp',
            \ },
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank']},
            \ })
call ddc#enable()
