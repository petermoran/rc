" Peter Moran .vimrc
" ==================
"
" Sources
" -------
" https://github.com/mbrochh/vim-as-a-python-ide


" Pathogen for plugin management.
" >>> mkdir -p ~/.vim/autoload ~/.vim/bundle
" >>> curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
execute pathogen#infect()


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


" Quicksave command to Ctrl-Z
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


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Color scheme
" mkdir -p ~/.vim/colors; wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -O ~/.vim/colors/zenburn.vim
" https://github.com/jnurmine/Zenburn
" Download colors/zenburn.vim to ~/.vim/colors
set t_Co=256

let g:zenburn_high_Contrast=0
color zenburn

" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized

" let g:pencil_higher_contrast_ui=1
" color pencil

set cursorline


" Parentheses highlighting
" hi MatchParen cterm=bold ctermbg=none ctermfg=cyan
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

if exists('+colorcolumn')
    set colorcolumn=80
    " highlight ColorColumn ctermbg=238
    " highlight ColorColumn ctermbg=s:base03
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
set noautoindent


" Bash like tab-completion when opening files
set wildmode=longest:list
" set wildmode=longest:full,full


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
" N-s   -- namespace no indentation
" g0    -- public/private flat indentation
" :0    -- flat switch case indentation
" is    -- indent initializer list by one
set cindent
set cino=N-s,g0,:0,(0,W4,is,+s

" Recognise .tpp files as c++
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp

" Source/header file switching with F4
" $ mkdir -p ~/.vim/plugin
" $ cd ~/.vim/plugin && wget https://raw.githubusercontent.com/derekwyatt/vim-fswitch/master/plugin/fswitch.vim
map <F4> :FSHere<CR>

" Install plugins:
" >>> cd ~/.vim/bundle
" >>> git clone git://github.com/tpope/vim-sensible.git
" >>> git clone git://github.com/klen/python-mode.git
" >>> git clone --recursive https://github.com/davidhalter/jedi-vim.git
" xxx >>> git clone https://github.com/hynek/vim-python-pep8-indent.git

let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1

let g:pymode_trim_whitespaces = 1

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']  " , 'mccabe']
" let g:pymode_lint_checkers = ['pep8']

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_autoimport = 0
" let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
" let g:pymode_rope_autoimport_import_after_complete = 0


" Ignore some annoying pep messages.
" let g:pymode_lint_ignore = "E501,W0401,C901,E731"
let g:pymode_lint_ignore = "E501,W0401,C901,E731"

" let g:NERDSpaceDelims = 1

let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" autopep8 (requires pip install autopep8)
let g:autopep8_select = "E126,E127,E128,E131,E202,E203,E225,E231,E262,E265,E266,E301,E302,E303,E231,E251,E265"
let g:autopep8_disable_show_diff = 1

" >>> git clone https://github.com/scrooloose/syntastic.git
" >>> conda install pylint
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 
" let g:syntastic_python_checkers = ['flake8']
