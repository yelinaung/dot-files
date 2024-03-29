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
  set guifont=Fira\ Code\ 12
  "set guifont=Fira\ Mono:h16
endif

set showtabline=2
set title

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
"
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-rails'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
" Plug 'sidebar-nvim/sidebar.nvim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
" Plug 'ctrlpvim/ctrlp.vim' " sublime style ctrl p
Plug 'tmux-plugins/vim-tmux'
Plug 'w0rp/ale' " lint engine
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'terryma/vim-multiple-cursors'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'scrooloose/syntastic'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'davidhalter/jedi-vim',
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'easymotion/vim-easymotion'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'digitaltoad/vim-pug',
Plug 'Yggdroot/indentLine'
Plug 'digitalrounin/vim-yaml-folds'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'pelodelfuego/vim-swoop'
Plug 'vim-syntastic/syntastic'
Plug 'wakatime/vim-wakatime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'
Plug 'ambv/black'
Plug 'edgedb/edgedb-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'mfussenegger/nvim-dap'
Plug 'wlangstroth/vim-racket'
Plug 'rust-lang/rust.vim'

call plug#end()

autocmd FileType python setlocal foldmethod=indent
let g:python_highlight_all = 1

" need to test yapf
"autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
"autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

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
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection=0

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
" syntax enable
set grepprg=grep\ -nH\ $*

set showcmd      " Shows what you are typing as a command
set nocompatible " Necessary for lots for cool vim things
set ruler        " Always show current positions along the bottom
set nu           " Set linenumber
set ai           " Auto indent
set si           " Smart indet
set wrap         " Wrap lines
syntax on
" set relativenumber

" No sound on errors
set noerrorbells
set novisualbell
set ignorecase   " Ignore case when searching
set smartcase
set hlsearch     " Highlight search things
set incsearch    " Make search act like search in modern browsers
set magic        " Set magic on, for regular expressions
set showmatch    " Show matching bracets when text indic


set softtabstop=4
set tabstop=4
set expandtab     " Convert Tabs into Spaces
set shiftwidth=4
set expandtab
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
" vmap <Leader>y "+y
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
"nnoremap <CR> G
nnoremap <BS> gg

map <q> <Nop>
map q: :q

let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=[".git", '\.pyc$']

nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFind<cr>

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

map <Leader>p :call InsertPDB()<CR>

function! InsertPDB()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

let @t = 'cwraise tornado.gen.Return(lxA)^'

map <C-x> :w<CR>:!python %<CR>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

"case insensitive
let g:EasyMotion_smartcase = 1

" instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', 'FIXME', -1)
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsx setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType js setlocal ts=4 sts=4 sw=4 expandtab


" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" nmap s <Plug>(easymotion-overwin-f)
nmap <Leader>' <Plug>(easymotion-s2)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" map Leader (space) + h for no highlight search
nmap <Leader>h :noh<CR>

" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim<Paste>
"if executable('ag')
  "" Use ag over grep
   "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "" ag is fast enough that CtrlP doesn't need to cache
   "let g:ctrlp_use_caching = 0
   "let g:ackprg = 'ag --vimgrep'
"endif

" use ctrl p with rg aka ripgrep
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'

  let g:ackprg = 'rg --vimgrep --no-heading'
endif

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" toggle between :paste and :nopaste
set pastetoggle=<F3>

nmap <Leader>ml :call SwoopMulti()<CR>
vmap <Leader>ml :call SwoopMultiSelection()<CR>

let g:jedi#completions_enabled = 0
let $JS_CMD='node'

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

nmap <leader>t :TagbarToggle<CR>
set background=dark

map <C-n> :NERDTreeToggle<CR>

nmap <leader>t :TagbarToggle<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

nnoremap <leader>cl :CocDiagnostics<cr>
nnoremap <leader>cf <Plug>(coc-fix-current)
nnoremap <leader>ch :call CocActionAsync('doHover')<cr>
nnoremap <leader>b :Black<cr>

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>pp <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Switching between the terminal and normal buffer
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

let g:coc_node_path = trim(system('which node'))
let g:syntastic_enable_racket_racket_checker = 1
call deoplete#custom#option('auto_complete_delay', 100)
