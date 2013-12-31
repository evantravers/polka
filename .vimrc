" -polka-

" Start .vimrc
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

scriptencoding utf-8

"=============================================
" Initialization
"=============================================

" Load neobundle
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimshell.vim"
NeoBundle "SirVer/ultisnips"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "bling/vim-airline"
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle "golangtw/gocode.vim"
NeoBundle "gregsexton/MatchTag"
NeoBundle "hail2u/vim-css3-syntax"
NeoBundle "juvenn/mustache.vim"
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle "mattn/emmet-vim"
NeoBundle "mattn/gist-vim"
NeoBundle "mattn/webapi-vim"
NeoBundle "scrooloose/syntastic"
NeoBundle "sgur/unite-git_grep"
NeoBundle "slim-template/vim-slim"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-eunuch"
NeoBundle "tpope/vim-speeddating"
NeoBundle "uggedal/go-vim"
NeoBundle "vim-scripts/Gundo"
NeoBundle "vim-scripts/php.vim"
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'duff/vim-scratch'
NeoBundle 'dhruvasagar/vim-railscasts-theme'
NeoBundle 'cseelus/vim-colors-clearance'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'mklabs/grunt.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

" Load plugins now

filetype plugin indent on

"=============================================
" Options
"=============================================

" Enable utf-8
set encoding=utf-8

" Color
set t_Co=256
set background=dark
colorscheme jellybeans
syntax on

" Some color customizations
set fillchars=vert:\│
set colorcolumn=80

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi SignColumn ctermbg=NONE
hi ColorColumn ctermbg=235
hi LineNr ctermbg=NONE
hi VertSplit term=bold cterm=NONE ctermfg=234 ctermbg=234 gui=NONE guifg=0 guibg=0

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
let g:bufferline_echo = 0

" Turn off error bells
set noerrorbells
set visualbell
set t_vb=

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Tab completion
set wildmode=list:longest,full
set wildignore=*.swp,*.o,*.so,*.exe,*.dll
set wildmenu

" Scroll
set scrolloff=3

" Tab settings
set ts=2
set sw=2
set expandtab

" make escape work sensibly
set esckeys!

" Hud
set ruler
set number
set laststatus=2 " Always show status bar
set nowrap

" Visible whitespace
set listchars=tab:»·,trail:·
set list

" Buffers
set hidden

" History
set history=1000
set undolevels=1000

" Backup Directories
set backupdir=~/.vim/backups,.
set directory=~/.vim/swaps,.
if exists('&undodir')
  set undodir=~/.vim/undo,.
endif

" Fix backspace
set backspace=indent,eol,start

" GUI options
if (has('gui_running'))
  set guifont=Inconsolata-dz:h12
  set guioptions-=T
  set guioptions-=m
endif

"=============================================
" Unite.vim
"=============================================

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command = 'ag -i --nocolor --nogroup --ignore --ignore ''.git'' --ignore ''.bzr'' --ignore ''node_modules'' --hidden -g ""'
endif


" file search
nnoremap <C-p> :Unite -no-split -start-insert file_rec/async:!<cr>
" content search
nnoremap <space>/ :Unite grep:.<cr>
" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
" buffer switch
nnoremap <space>s :Unite -quick-match -auto-preview buffer<cr>

" ignore certain directories in unite
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.tmp/',
      \ '\tmp',
      \ 'build',
      \ '.|*cache*/',
      \ ], '\|'))

"=============================================
" Remaps
"=============================================

let mapleader=','
let maplocalleader=','

" No arrow keys
map <Left>  :echo "ಠ_ಠ"<cr>
map <Right> :echo "ಠ_ಠ"<cr>
map <Up>    :echo "ಠ_ಠ"<cr>
map <Down>  :echo "ಠ_ಠ"<cr>

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

" use gundo.vim
nnoremap <F3> :GundoToggle<CR>

" use dash plugin
nnoremap <F1> :Dash<CR>

" prevent syntastic from checking html constantly
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Jump key
nnoremap ` '
nnoremap ' `

" Change pane
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Turn off search highlight
nnoremap <localleader>/ :nohlsearch<CR>

" Trim trailing whitespace
nnoremap <localleader>ws m`:%s/\s\+$//e<CR>``

" Set up soft wrap for prose
command! -nargs=* Wrap set wrap linebreak nolist
let &showbreak='↪ '

" Check for missing packages
NeoBundleCheck
