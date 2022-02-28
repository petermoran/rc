" need to enable ALE completion before plugin loads
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 0
" set omnifunc=ale#completion#OmniFunc
" set completeopt+=noinsert

" add fzf path
set rtp+=~/usr/src/fzf

" pathogen load
" filetype off
" execute pathogen#infect()

let g:python_highlight_all = 1
syntax on
filetype plugin indent on

" better copy/paste with F10 toggle
" set pastetoggle=<F10>
" set clipboard=unnamed

set tabstop=4       " tab width is 4 spaces
set shiftwidth=4    " indent also with 4 spaces
set expandtab       " expand tabs to spaces
set softtabstop=4   " makes bksp remove 4 spaces

set nocompatible    " disable vi compatibility (emulation of old bugs)
set autoindent      " use indentation of previous line
set nosmartindent   " use intelligent indentation for C

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
" packadd! edge
" packadd! onedark.vim
"" packadd! gruvbox-material

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark

" https://github.com/NLKNguyen/papercolor-theme/blob/master/DESIGN.md
let g:PaperColor_Theme_Options = {
            \   'language': {
            \     'python': {
            \       'highlight_builtins' : 1
            \     },
            \     'cpp': {
            \       'highlight_standard_library': 1
            \     },
            \     'c': {
            \       'highlight_builtins' : 1
            \     }
            \   },
            \   'theme': {
            \     'default.dark': {
            \       'override' : {
            \         'color00' : ['#262626', '235'],
            \         'color07' : ['#e4e4e4', '254'],
            \         'linenumber_fg' : ['#444444', '238'],
            \         'linenumber_bg' : ['#262626', '235'],
            \         'cursorlinenr_fg' : ['#bcbcbc', '235'],
            \         'cursorlinenr_bg' : ['#1c1c1c', '234'],
            \       }
            \     }
            \   }
            \ }

" colorscheme peterdark
" colorscheme hybrid_material
" colorscheme gruvbox-material
colorscheme PaperColor

" set t_Co=256
" let g:gruvbox_contrast_dark="medium"
" colorscheme gruvbox

" set background=dark
" colorscheme onedark

" let g:neodark#background = '#303030'
" " let g:neodark#use_256color = 1
" colorscheme neodark

" set background=dark
" let g:gruvbox_italics=0
" colorscheme gruvbox8

" set background=dark
" let g:edge_disable_italic_comment = 1
" colorscheme edge

" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" let g:material_theme_style = 'default'
" let g:material_terminal_italics = 0
" colorscheme material

set number     " turn line numbers on
set showmatch  " highlight matching braces
set cursorline

" rainbow parentheses improved
let g:rainbow_active = 1
" let g:rainbow_conf = {'separately': {'cmake': 0}}
let g:rainbow_guifgs = [
    \ '#c464a3',
    \ '#ba7d1a',
    \ '#b5cc79',
    \ '#89d3e8',
    \ '#da5c84',
    \ '#71baf9',
    \ '#e7c085',
    \ '#b888e2',
    \ '#54d1bf',
    \ '#c7c18b',
    \ '#c2948d',
    \ ]

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" use custom pm-make script for dispatch/make
set makeprg=pm-make
" set makeprg=make

" disable 'recording' command
nnoremap q <Nop>

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" recognise .tpp files as c++
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
autocmd BufNewFile,BufReadPost *.q set filetype=q
autocmd BufNewFile,BufReadPost *.k set filetype=k

set autowrite
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Delete buffer without closing window
:command! BufferDelete :bn|:bd#

" leader (\ key) bindings
" space : disable search highlighting
nnoremap <leader><space> :nohlsearch<esc>
" n, p : next, previous quickfix error
" nnoremap <leader>n :cn<esc>
" nnoremap <leader>p :cN<esc>
" r : search replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/
" common commands
nnoremap <leader>w :w<esc>
nnoremap <leader>x :BufferDelete<esc>
nnoremap <leader>q :qa<esc>
nnoremap <leader>o :only<esc>
nnoremap <leader>c :Make<esc>
" fzf commands
nnoremap <leader>b :Buffers<esc>
nnoremap <leader>f :FZF<esc>
nnoremap <leader>g :Rg<esc>
" ale commands
nnoremap <leader>a :ALENextWrap<CR>
nnoremap <leader>p :ALEPreviousWrap<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>v :ALEFix<CR>
" nerdtree commands
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <leader>z :call CurtineIncSw()<esc>
" open file starting in cwd for buffer
nnoremap <Leader>e :e <C-R>=expand("%:h") . "/" <CR>

" ctrl h/l to shift tabs
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
