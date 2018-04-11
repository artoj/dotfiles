set nocompatible

execute pathogen#infect()

filetype plugin indent on
syntax on
syntax spell toplevel
set synmaxcol=256

set number
set showcmd
set autoread

if has('gui_running')
    " Disable cursor blinking
    set guicursor+=a:blinkon0
    " Disable most of the GUI stuff
    set guioptions=ai
elseif (&term == 'xterm' || &term == 'xterm-256color' || &term == 'screen' || &term == 'screen-256color')
    set t_Co=256
else
    set t_Co=8
endif

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
let mapleader=","

set laststatus=2
set display+=lastline
set wildmenu
set wildignore=*.o,moc_*.cpp,ui_*.h,tags,*.pyc

set ttimeoutlen=50  " Make Esc work faster

set tabstop=4
set shiftwidth=4

set ruler

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set autoindent
set cinoptions=+4:0t0(4u0 " OpenBSD style
set formatoptions+=j
set complete-=i     " Searching includes can be slow

" Search
set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set smarttab

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Moving around in windows Ctrl-<movement key>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if !exists('autocommands_loaded') " Don't load autocmds twice
    let autocommands_loaded = 1
    autocmd FileType * setlocal nocindent
    autocmd FileType c,cpp setlocal cindent tabstop=8 shiftwidth=8
    autocmd FileType mail,gitcommit setlocal textwidth=72 expandtab spell
    autocmd FileType tex setlocal textwidth=78 expandtab spell
    autocmd FileType qmake setlocal expandtab
    autocmd FileType erlang setlocal expandtab
	autocmd FileType help nnoremap <silent><buffer> q :q<CR>
    autocmd FileType markdown setlocal textwidth=78 linebreak spell

    " Automatically source $MYVIMRC after writing it
    autocmd BufWritePost .vimrc source $MYVIMRC
endif

"{{{ Splits
set splitbelow "New splits below, not above
set splitright "New splits on the right, not left
"}}}

let g:is_posix=1

" Create a new file with visual selection
function! PasteNewFile() range
	silent execute a:firstline.",".a:lastline."yank"
	silent execute "new +put! \""
endfunction

vnoremap <leader>n :call PasteNewFile()<CR>

" expands :e to the current file's directory
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
" expands :sp to the current file's directory
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
" expands :vsp to the current file's directory
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>

" foreign spell checking
set spelllang=en_us
nnoremap <silent> <leader>s :set spell!<CR>

" I typo these
ia widht width
ia lenght length
