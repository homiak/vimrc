" disable vi compatibility (probably not necessary for neovim)
" set nocompatible

" configure vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'fatih/molokai'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'solarnz/thrift.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'wesQ3/vim-windowswap'

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

" save files before make
set autowrite

" visual bell instead of dingdong
set visualbell

" enable auto completion for command options
set wildmenu
set wildmode=list:full

" set text width to 60 chars for reformatting
" documentation with :gq
set textwidth=60

" assume a fast tty
" set ttyfast

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

" store vim buffers on system clipboard
" set clipboard=unnamed

" save on focus lost
au FocusLost * :wa

" indentation settings
au FileType html setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" set color scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" enable syntax highlighting
syntax enable

" make , the leader char
let mapleader = ","

" ,l : toggle list mode
nnoremap <leader>l :set list!<cr>

" ,w : trim whitespace
nnoremap <leader>w :StripWhitespace<cr>

" ,ev : open vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" ,rv : reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" ,v : open todo list
nnoremap <leader>T <C-w><C-v><C-l>:e ~/todo.md<cr>

" ,Q : quit without warning
nnoremap <leader>Q :qa!<cr>

" move line/block up/down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv<Paste>

" map search to ctrl-f
nnoremap <C-f> <Esc>/
inoremap <C-f> <Esc><Esc>/

" toggle line numbers
nnoremap <leader>N :set number!<cr>

" close current buffer but don't change the layout
nnoremap <leader>q :bp\|bd #<cr>

" buffer management
nnoremap <leader>n :bnext<cr>
nnoremap <leader>m :bprev<cr>

" undo
nnoremap <leader>u :undo<cr>

" markdown config

" disable folding
let g:vim_markdown_folding_disabled = 1

" auto-indent bullet lists
let g:vim_markdown_new_list_item_indent = 2

" quickfix navigation shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" go config

" use goimports for Go
let g:go_fmt_command = "goimports"

" use godef instead of guru. Supposedly its faster
let g:go_def_mode = "godef"

" use only quickfix for Go errors
let g:go_list_type = "quickfix"

" hightlight types
let g:go_highlight_types = 1

" hightlight build tags
let g:go_hightlight_build_constraints = 1

" always show type after 100ms
let g:go_auto_type_info = 1
set updatetime=100

" go shortcuts
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <leader>? <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" YCM disable top window preview
set completeopt-=preview

" FZF config
set rtp+=/usr/local/opt/fzf

nnoremap <leader>, :Files<cr>

" NERDTree config

" show NERDTree on the right
" let g:NERDTreeWinPos = "right"

" arrow symbols for directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open with nerdtree if there were no cmd args
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <leader>d :NERDTreeFind<cr>
nnoremap <leader>f :NERDTreeToggle<cr>

" close vim if nerdtree is the last open buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline config

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" highlight the current line
set cursorline

