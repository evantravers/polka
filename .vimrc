" -polka-

"=============================================
" Initialization
"=============================================

call plug#begin('~/.vim/bundle')

Plug '1995eaton/vim-better-css-completion', { 'for' : 'css' }
Plug '1995eaton/vim-better-javascript-completion', { 'for' : 'javascript' }
Plug 'AndrewRadev/gapply.vim'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'StanAngeloff/php.vim', { 'for' : 'php' }
Plug 'Wolfy87/vim-enmasse'
Plug 'airblade/vim-gitgutter'
Plug 'dsawardekar/wordpress.vim', { 'for' : 'php' }
Plug 'mtth/scratch.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' }
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'golangtw/gocode.vim', { 'for' : 'go' }
Plug 'gregsexton/MatchTag'
Plug 'guns/vim-clojure-static', { 'for' : 'clojure' }
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/vim-snippets'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on' : 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on' : 'Limelight' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'kien/rainbow_parentheses.vim', { 'for' : 'clojure' }
Plug 'kopischke/vim-fetch'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do' : 'npm install', 'for' : 'javascript' }
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-rfc'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' } " optional syntax highlighting for RFC files
Plug 'mustache/vim-mustache-handlebars'
Plug 'ryanoasis/vim-webdevicons'
Plug 'scrooloose/syntastic'
Plug 'shawncplus/phpcomplete.vim', { 'for' : 'php' }
Plug 'simnalamburt/vim-mundo', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/matchit.zip'
Plug 'w0ng/vim-hybrid'
Plug 'wellle/targets.vim'

call plug#end()

"=============================================
" Options
"=============================================

" Color
" set t_Co=256
" let g:seoul256_background = 235
let g:hybrid_use_Xresources = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid

" Some color customizations
" set fillchars=vert:\│
set colorcolumn=80

" airline
let g:airline_powerline_fonts=1
let g:bufferline_echo = 0
let airline#extensions#default#section_use_groupitems = 0

" dark mode
" if &background == "dark"
"   " let g:airline_theme='bubblegum'
"   let g:airline_theme='base16'
" endif
let g:airline_theme='bubblegum'

" Turn off error bells
set noerrorbells
set visualbell

" Search
set ignorecase
set smartcase
set hlsearch

" Tab completion
set wildmode=list:longest,full
set wildignore=*.swp,*.o,*.so,*.exe,*.dll

" Scroll
set scrolloff=3

" Tab settings
set ts=2
set sw=2
set expandtab

" make escape work sensibly
set esckeys!

" make visual block extend past line endings
set virtualedit=block

" Hud
set number
set nowrap

" Visible whitespace
set listchars=tab:»·,trail:·
set list

" Buffers
set hidden

set undolevels=1000

" Backup Directories
set backupdir=~/.vim/backups,.
set directory=~/.vim/swaps,.
if exists('&undodir')
  set undodir=~/.vim/undo,.
endif

" GUI options
if (has('gui_running'))
  set guifont=Inconsolata-dz:h12
  set guioptions-=T
  set guioptions-=m
endif

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

" use gundo.vim
nnoremap <F3> :GundoToggle<CR>

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

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Set up soft wrap for prose
command! -nargs=* Wrap set wrap linebreak nolist spell
let &showbreak='↪ '

" Toggle paste mode
set pastetoggle=<leader>z

" Fancy macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" enable tagbar toggle
nmap <F9> :TagbarToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Configure Limelight and Goyo
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
nnoremap <Leader>m :Goyo<CR>

" Change some settings for clojure
augroup RainbowParentheses
  autocmd!
  autocmd Syntax clojure RainbowParenthesesLoadRound
  autocmd Syntax clojure RainbowParenthesesLoadSquare
  autocmd Syntax clojure RainbowParenthesesLoadBraces
  " autocmd Syntax clojure RainbowParenthesesLoadChevrons
  autocmd VimEnter,BufRead,BufWinEnter,BufNewFile *.clj RainbowParenthesesActivate
augroup END

" enable fenced markdown files
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Settings for phpcomplete.vim
let g:phpcomplete_enhance_jump_to_definition = 0

" enable es6
augroup javascriptfiletype
  au BufRead,BufNewFile *.js.es6 setfiletype javascript
augroup END

" fancy tag lookup
set tags=./tags;/,tags;/

" open quickfix after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow
