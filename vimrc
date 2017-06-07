set nocompatible              " be iMproved, required
filetype off                  " required
set ff=unix
set encoding=utf-8

" set guifont=Inconsolata\ LGC:h14
" - font type and size setting.
if has('win32')
  set guifont=Consolas:h12    " Win32.
elseif has('gui_macvim')
  set guifont=Fira\ Code:h14  " OSX.
else
  set guifont=Fira\ Mono:h16
endif


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
"
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'
" Plugin 'itchyny/lightline.vim'
" Plugin 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim' " sublime style ctrl p
Plug 'tmux-plugins/vim-tmux'
Plug 'w0rp/ale' " lint engine
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Valloric/YouCompleteMe'
" Plug 'python-mode/python-mode'
Plug 'vim-python/python-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'scrooloose/syntastic'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'davidhalter/jedi-vim'
Plug 'mindriot101/vim-yapf'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
call plug#end()

let g:python_highlight_all = 1

" need to test yapf
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
" autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

" `za` - toggles
" `zc` - closes
" `zo` - opens
" `zR` - open all
" `zM` - close all

" folding settings
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

filetype plugin indent on    " required

let g:airline_powerline_fonts=1
let g:airline_theme='luna'

" Treat rabl as ruby
au BufRead,BufNewFile *.rabl setf ruby

" Always show the status line
set ls=2

" Keep 3 lines when scrolling
set scrolloff=3

set mouse=a        " Enable mouse support in console
colorscheme Tomorrow-Night

" kj - Get out of Insert mode
imap kj <Esc>
imap jj <Esc>
imap ;; <Esc>

" Special case for Go files
" autocmd FileType go set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
" gofmt on save
" autocmd BufWritePre *.go Fmt

filetype on
filetype plugin on
filetype indent on
syntax enable
set grepprg=grep\ -nH\ $*

set showcmd      " Shows what you are typing as a command
set nocompatible " Necessary for lots for cool vim things
set ruler        " Always show current positions along the bottom
set nu           " Set linenumber
set ai           " Auto indent
set si           " Smart indet
set wrap         " Wrap lines
syntax on

" No sound on errors
set noerrorbells
set novisualbell
set ignorecase   " Ignore case when searching
set smartcase
set hlsearch     " Highlight search things
set incsearch    " Make search act like search in modern browsers
set nolazyredraw " Don't redraw while executing macros
set magic        " Set magic on, for regular expressions
set showmatch    " Show matching bracets when text indic

" set tabstop=2
" set shiftwidth=1
set expandtab     " Convert Tabs into Spaces
" set softtabstop=2 " Tab conversion to number of spaces
" set shiftwidth=2  " Auto-indent amount
set shiftround    " When at 3 spaces, when I hit > .. go to 4, not 5

set cursorline
set cursorcolumn

set noswapfile
set nobackup
set nowritebackup
set autowriteall
set autoread
au FocusLost * :wa " Auto Save when losing focus
set backspace=indent,eol,start

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let mapleader = "\<Space>"

" Space + W for file write
nnoremap <Leader>w :w<CR>

" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Go to line number x with x<Enter> to go to line x
nnoremap <CR> G
nnoremap <BS> gg

map <q> <Nop>
map q: :q

let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1

set shortmess=a
" set cmdheight=2

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

set lazyredraw
set completeopt-=preview
set clipboard+=unnamedplus

" disable pylint
let pymode_lint_ignore=0
let g:pymode_rope_completion = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

" call deoplete#enable()

