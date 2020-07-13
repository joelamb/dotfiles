filetype plugin indent on
syntax enable                           " Enables syntax highlighing

let mapleader="\'"

"set autochdir                           " Your working directory will always be the same as your working directory
set autoindent                          " Good auto indent
set autoread                            " Update buffer changed outside neovim
set background=dark                     " tell vim what the background color looks like
set backspace=indent,eol,start          " Backspace everywhere
set clipboard=unnamedplus               " Copy paste between vim and everything else
set cmdheight=1                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " Enable highlighting of the current line
set encoding=utf-8                      " The encoding displayed
set expandtab                           " Converts tabs to spaces
set fileencoding=utf-8                  " The encoding written to file
set fileencodings=utf-8                 " The encoding written to file
set formatoptions-=cro                  " Stop newline continution of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set hlsearch                            " Highlight search matches
set ignorecase                          " Case agnostic search
set incsearch                           " Show search matches as they're typed
set iskeyword+=-                      	" treat dash separated words as a word text object"
set laststatus=0                        " Always display the status line
set mouse=a                             " Enable your mouse
set nobackup                            " This is recommended by coc
set noerrorbells visualbell t_vb=       " Disable visual error bell
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nowrap                              " Display long lines as just one line
set nowritebackup                       " This is recommended by coc
set number                              " Line numbers
set pumheight=10                        " Makes popup menu smaller
set relativenumber                      " Relative line numbers for easier vertical movement
set ruler              	                " Show the cursor position all the time
set shiftround                          " Round indents to nearest multiple of shiftwidth
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set showtabline=2                       " Always show tabs
set smartcase                           " Override ignorecase if search term includes uppercase characters
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set softtabstop=2                       " Match cursor tab movement to tab width
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=2                           " Insert 2 spaces for a tab
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion

"" do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" grep with Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
" cmap w!! w !sudo tee %
