" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

"" fuzzy find
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

"" git
Plug 'tpope/vim-fugitive'
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gvd :Gvdiff<CR>

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

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"" workspace
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
