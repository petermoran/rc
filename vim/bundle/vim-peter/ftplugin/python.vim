setlocal formatoptions=crnqjo

set completeopt+=noinsert

let b:ale_linters = ['pyls']
let b:ale_fixers = ['yapf', 'isort']

set tabstop=4       " tab width is 4 spaces
set shiftwidth=4    " indent also with 4 spaces
set expandtab       " expand tabs to spaces
set softtabstop=4   " makes bksp remove 4 spaces
