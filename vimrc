" need to enable ALE completion before plugin loads
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
nnoremap <C-a> :ALENextWrap<CR>
nnoremap <C-s> :ALEPreviousWrap<CR>
nnoremap <F2> :ALEGoToDefinition<CR>

" add fzf path
set rtp+=~/usr/src/fzf
set rtp+=~/usr/src/fzf.vim

" pathogen load
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

" auto reload vimrc after saving
autocmd! bufwritepost .vimrc source %

" better copy/paste with F10 toggle
" set pastetoggle=<F10>
" set clipboard=unnamed

set nocompatible    " disable vi compatibility (emulation of old bugs)
set autoindent      " use indentation of previous line
set nosmartindent   " use intelligent indentation for C
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
" let g:gruvbox_contrast_light="medium"
" set background=light
colorscheme gruvbox

set number     " turn line numbers on
set showmatch  " highlight matching braces
set cursorline

" rainbow parentheses improved
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'cmake': 0}}

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
" nnoremap <leader>e :e %:h<esc>
" n : next quickfix error
nnoremap <leader>n :cn<esc>
" p : previous quickfix error
nnoremap <leader>p :cN<esc>
" d : close buffer
nnoremap <leader>d :bdelete<esc>
nnoremap <leader>q :qa<esc>

nnoremap <leader>c :make -j8 -C build<esc>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" fzf commands
nnoremap <leader>f :Files<esc>
nnoremap <leader>g :Rg<esc>

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

set autowrite
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Function to make ALE completion and Supertab completion play nice
" by first trying ALE and then falling back to default vim.
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

" buffer switching
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" show tabs
" set list
" set listchars=tab:>-
