set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/bundle"')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vundle
Plugin 'fatih/vim-go'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'godlygeek/tabular'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'slim-template/vim-slim.git'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'Raimondi/delimitMate'
Plugin 'kshenoy/vim-origami'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-heroku'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" External programs
cnoremap lsf !ls
cnoremap gft !gofmt -w %:p
cnoremap grn !go run %:p

" gofmt on save
au FileType go au BufWritePre <buffer> Fmt

" Treat rabl as ruby
au BufRead,BufNewFile *.rabl setf ruby

" Always show the status line
set ls=2

" Keep 3 lines when scrolling
set scrolloff=3

set mouse=a        " Enable mouse support in console
set gfn=Monaco\ 12
set guifont=Monaco\ 12
colorscheme Tomorrow-Night

" kj - Get out of Insert mode
imap kj <Esc>
imap jj <Esc>

" Special case for Go files
autocmd FileType go set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

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

set tabstop=2
set shiftwidth=1
set expandtab     " Convert Tabs into Spaces
set softtabstop=2 " Tab conversion to number of spaces
set shiftwidth=2  " Auto-indent amount
set shiftround    " When at 3 spaces, when I hit > .. go to 4, not 5

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
