"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'davidgranstrom/scnvim'
Plug 'tidalcycles/vim-tidal'
Plug 'jelera/vim-javascript-syntax'

" let g:make = 'gmake'
" if exists('make')
"   let g:make = 'make'
" endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set nobackup
set nowritebackup
set updatetime=300

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

"" Map leader to space
nnoremap <space> <Nop>
let mapleader=' '

"" Emmet leader
let g:user_emmet_leader_key='<C-Z>'

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>f :Files<CR>

" fzf - fuzzy finder
set rtp+=/usr/local/opt/fzf

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 50
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <C-n> :NERDTreeToggle<CR>

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"" Workspace formating
set relativenumber
set number

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"vimshell.vim
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_prompt =  '$ '

" terminal emulation
" if g:vim_bootstrap_editor == 'nvim'
 nnoremap <silent> <leader>sh :terminal<CR>
" else
  " nnoremap <silent> <leader>sh :VimShellCreate<CR>
" endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
" augroup vimrc-make-cmake
"   autocmd!
"   autocmd FileType make setlocal noexpandtab
"   autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
" augroup END

"" Tidal comments
autocmd FileType tidal setlocal commentstring=--\ %s

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Quick escape
inoremap jk <Esc>

"" Blank line and no insert
noremap <leader> o o<Esc>
"" Disable arrow keys to break the habit
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Easier window scrolling
noremap <C-k> <C-u>
noremap <C-j> <C-d>

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Git
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>


"" Open current line on GitHub
nnoremap <leader>o :.Gbrowse<CR>

"" Tidal mappings
let g:tidal_no_mappings=1
nmap <C-e> <Plug>TidalParagraphSend
imap <C-e> <Esc><Plug>TidalParagraphSend
let maplocalleader=','
nnoremap <localleader>h :TidalHush<cr>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4 smartindent
augroup END

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" tidal vim
let g:tidal_target = "terminal"


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvimrc.local"))
  source ~/.config/nvimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" let g:airline#extensions#tabline#enabled = 1

"" color scheme
syntax on
colorscheme gruvbox