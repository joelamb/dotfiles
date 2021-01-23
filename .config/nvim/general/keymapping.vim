"" set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" clear search highlight
nnoremap <silent> <leader><space> :noh<cr>

"" quick escape
inoremap jk <Esc>

"" splitting windows
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-q> <C-w>q

"" switching buffers
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" closing buffers
noremap <leader>c :bd<CR>
