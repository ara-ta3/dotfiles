if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyright',
                \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
                \ 'whitelist': ['python'],
                \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {server_info->['gopls']},
                \ 'whitelist': ['go'],
                \ })
endif

nnoremap <C-i> :LspHover<CR>
nnoremap <C-d> :LspDefinition<CR>
nnoremap <C-b> :LspImplementation<CR>
