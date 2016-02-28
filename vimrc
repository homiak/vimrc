" disable vi compatibility (probably not necessary for neovim)
set nocompatible

" configure vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Shougo/neocomplete.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'fatih/molokai'
Plugin 'fatih/vim-go'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'solarnz/thrift.vim'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" disable modelines (security risk)
set modelines=0

" default file encoding
set encoding=utf-8

" keep cursor in the middle of the screen
set scrolloff=999

" indent blocks automatically
set autoindent

" visual bell instead of dingdong
set visualbell

" highlight the current line
set cursorline

" enable auto completion for command options
set wildmenu
set wildmode=list:full

" assume a fast tty
set ttyfast

" show line and column in status bar
set ruler

" backspace over indent and eol
set backspace=indent,eol,start

" enable line numbers
set number

" enable persistent undo file
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" make tabs 4 chars wide
set tabstop=4
set shiftwidth=4

" use tabs instead of spaces
set noexpandtab

" define tab and EOL characters for list mode
set listchars=tab:▸\ ,eol:¬

" allow modified buffers to be hidden
set hidden

" enable mouse support
set mouse=a

" save on focus lost
au FocusLost * :wa

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" set color scheme
colorscheme molokai

" enable syntax highlighting
syntax enable

" make , the leader char
let mapleader = ","

" ,l : toggle list mode
nnoremap <leader>l :set list!<cr>

" ,w : trim whitespace
nnoremap <leader>w :StripWhitespace<cr>

" ,ev : open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" ,rv : reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" ,v : open todo list
nnoremap <leader>T <C-w><C-v><C-l>:e ~/todo.md<cr>

" ,Q : quit without warning
nnoremap <leader>Q :qa!<cr>

" move line/block up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" toggle line numbers
nnoremap <leader>N :set number!<cr>

" close current buffer but don't change the layout
nnoremap <leader>q :bp\|bd #<cr>

" buffer management
nnoremap <leader>n :bnext<cr>
nnoremap <leader>m :bprev<cr>

" undo
nnoremap <leader>u :undo<cr>

" go config

" use goimports for Go
let g:go_fmt_command = "goimports"

" go shortcuts
nnoremap <leader>gb :GoBuild<cr>
nnoremap <leader>gt :GoTest<cr>

" NERDTree config

" show NERDTree on the right
" let g:NERDTreeWinPos = "right"

" arrow symbols for directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open with nerdtree if there were no cmd args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <leader>d :NERDTreeFind<cr>
nnoremap <leader>f :NERDTreeToggle<cr>

" close vim if nerdtree is the last open buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline config

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
