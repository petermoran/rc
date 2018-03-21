" pathogen load
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

" better copy/paste with F2 toggle
set pastetoggle=<F2>
set clipboard=unnamed

set nocompatible    " disable vi compatibility (emulation of old bugs)
set autoindent      " use indentation of previous line
set smartindent     " use intelligent indentation for C
set tabstop=4       " tab width is 4 spaces
set shiftwidth=4    " indent also with 4 spaces
set expandtab       " expand tabs to spaces

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" bash-like file completion
set wildmode=longest,list,full
set wildmenu

" appearance customisation
set t_Co=256
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized
" let g:zenburn_high_Contrast=0
" colorscheme zenburn

set number     " turn line numbers on
set showmatch  " highlight matching braces
set cursorline

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" python-mode customisation
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_ignore = []
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" c-indentation
set cindent
set cino=N-s,g0,:0,(0,W4,is,+s

" recognise .tpp files as c++
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
