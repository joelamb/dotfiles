call plug#begin('~/.config/nvim/autoload/plugged')

"" fuzzy find
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.8 } }

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

"" searching
Plug 'dyng/ctrlsf.vim'
nnoremap <C-F>t :CtrlSFToggle<CR>
nmap K <Plug>CtrlSFCwordPath<CR>

"" file explorer
Plug 'scrooloose/nerdtree'
noremap <space>e :NERDTreeToggle<CR>

"" git
Plug 'tpope/vim-fugitive'
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gsh :Gpush<CR>
nnoremap <leader>gll :Gpull<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gvd :Gvdiff<CR>

"" theme
Plug 'morhetz/gruvbox'

"" editor
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

Plug 'Yggdroot/indentLine'
Plug 'jelera/vim-javascript-syntax'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'pechorin/any-jump.vim'

"" workspace
Plug 'mhinz/vim-startify'

Plug 'szw/vim-maximizer'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

"" music
Plug 'tidalcycles/vim-tidal'
let g:tidal_target = "terminal"
let g:tidal_no_mappings=1

let maplocalleader=','
nnoremap <localleader>h :TidalHush<cr>
nmap <C-e> <Plug>TidalParagraphSend
imap <C-e> <Esc><Plug>TidalParagraphSend

augroup tidal-comments
  autocmd!
  autocmd FileType tidal setlocal commentstring=--\ %s
augroup END

call plug#end()
