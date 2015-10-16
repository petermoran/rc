" Peter Moran .vimrc
" ==================
"
" Sources
" -------
" https://github.com/mbrochh/vim-as-a-python-ide


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=r " on OSX press ALT and click
set bs=2 " make backspace behave like normal again


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" https://github.com/jnurmine/Zenburn
" Download colors/zenburn.vim to ~/.vim/colors
set t_Co=256
color zenburn


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Parentheses highlighting
hi MatchParen cterm=bold ctermbg=none ctermfg=cyan


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=238
endif


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set nosmartindent


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" c-indentation.
" http://vimdoc.sourceforge.net/htmldoc/indent.html#C-indenting
"
" (0,W4 -- better indentation for function args
" i0    -- better initialization list indentation
set cindent
set cino=(0,W4,i0,g-1

" Recognise .tpp files as c++
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp

" Pathogen for plugin management.
" >>> mkdir -p ~/.vim/autoload ~/.vim/bundle
" >>> curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
execute pathogen#infect()

" Install plugins:
" >>> cd ~/.vim/bundle
" >>> git clone git://github.com/tpope/vim-sensible.git
" >>> git clone git://github.com/klen/python-mode.git
" >>> git clone --recursive https://github.com/davidhalter/jedi-vim.git

" python-mode rope completion is slow
let g:pymode_rope = 0

" Ignore some annoying pep messages.
let g:pymode_lint_ignore = "E501,W0401,C901"

let g:NERDSpaceDelims = 1

let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
