" configure vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/molokai'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" disable vi compatibility (probably not necessary for neovim)
set nocompatible

" disable modelines (security risk)
set modelines=0

" default file encoding
set encoding=utf-8

" keep cursor in the middle of the screen
set scrolloff=3

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

" use tabs instead of spaces
set noexpandtab

" define tab and EOL characters for list mode
set listchars=tab:▸\ ,eol:¬

" save on focus lost
au FocusLost * :wa

" set color scheme
colorscheme molokai

" enable syntax highlighting
syntax enable

" make , the leader char
let mapleader = ","

" ,l : toggle list mode
nnoremap <leader>l :set list!<cr>

" ,W : trim whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ev : open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" ,rv : reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" go config

" use goimports for Go
let g:go_fmt_command = "goimports"

" NERDTree config

" show NERDTree on the right
let g:NERDTreeWinPos = "right"

" arrow symbols for directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open with nerdtree if there were no cmd args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ,nf : toggle nerdtree
nnoremap <leader>nn :NERDTreeToggle<cr>

