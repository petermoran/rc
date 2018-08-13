" pathogen load
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

" auto reload vimrc after saving
autocmd! bufwritepost .vimrc source %

" better copy/paste with F2 toggle
set pastetoggle=<F2>
set clipboard=unnamed

set nocompatible    " disable vi compatibility (emulation of old bugs)
set autoindent      " use indentation of previous line
set nosmartindent     " use intelligent indentation for C
set tabstop=4       " tab width is 4 spaces
set shiftwidth=4    " indent also with 4 spaces
set expandtab       " expand tabs to spaces
set softtabstop=4   " makes bksp remove 4 spaces

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" use :e %%/ to edit a file in the same path as current buffer
cabbr <expr> %% expand('%:p:h')
cabbr <expr> % expand('%:h')

" bash-like file completion
set wildmode=longest,list,full
set wildmenu

" appearance customisation
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox

set number     " turn line numbers on
set showmatch  " highlight matching braces
set cursorline

" rainbow parentheses improved
let g:rainbow_active = 1

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" leader (\ key) bindings
" space : disable search highlighting
nnoremap <leader><space> :nohlsearch<esc>
" w : write file
nnoremap <leader>w :w<esc>
" e : open dir of current file
nnoremap <leader>e :e %:h<esc>
" n : next quickfix error
nnoremap <leader>n :cn<esc>
" p : previous quickfix error
nnoremap <leader>p :cN<esc>

" disable 'recording' command
nnoremap q <Nop>

" python-mode customisation
let g:pymode_breakpoint = 0
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_indent = 1
let g:pymode_lint_ignore = ['E501', 'W605', 'C901']
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" recognise .tpp files as c++
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
