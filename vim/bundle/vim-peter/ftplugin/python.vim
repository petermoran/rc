setlocal formatoptions=crnqjo

let g:ale_python_pyls_executable = '/home/pmoran/miniconda3/envs/dxf/bin/pyls'
let g:ale_python_yapf_executable = '/home/pmoran/miniconda3/envs/dxf/bin/yapf'

let b:ale_linters = ['pyls']
let b:ale_fixers = ['yapf']
