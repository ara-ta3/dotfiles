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

if executable('metals')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'metals',
                \ 'cmd': ['metals'],
                \ 'whitelist': ['scala', 'sbt'],
                \ })
endif

nnoremap <C-i> :LspHover<CR>
nnoremap <C-d> :LspDefinition<CR>
nnoremap <C-b> :LspImplementation<CR>


" lint
let g:ale_linters = {
\   'markdown': ['textlint'],
\   'text': ['textlint'],
\   'scala': ['metals'],
\}
let g:ale_markdown_textlint_options = '--config ~/.textlintrc'
let g:ale_text_textlint_options = '--config ~/.textlintrc'
