setlocal formatoptions=crnqjo

let g:ale_python_pyls_executable = '/home/pmoran/miniconda3/envs/dxf/bin/pyls'

let b:ale_linters = ['pyls']
let b:ale_fixers = ['yapf']

