setlocal formatoptions=crnqjo

set completeopt+=noinsert

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=120

let b:ale_linters = ['pylsp']
let b:ale_fixers = ['yapf', 'isort']

let g:ale_python_pylsp_config = {
            \   'pylsp': {
            \     'configurationSources': ['flake8'],
            \   },
            \ }

set tabstop=4       " tab width is 4 spaces
set shiftwidth=4    " indent also with 4 spaces
set expandtab       " expand tabs to spaces
set softtabstop=4   " makes bksp remove 4 spaces
