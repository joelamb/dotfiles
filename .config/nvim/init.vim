set nocompatible
noremap <unique> ' <NOP>
let mapleader = "\'"
let maplocalleader = "\'"


"" use volta node
let g:node_host_prog = system('volta which neovim-node-host')

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/status.vim
source $HOME/.config/nvim/general/theme.vim
source $HOME/.config/nvim/general/abbreviations.vim
source $HOME/.config/nvim/general/keymapping.vim
source $HOME/.config/nvim/coc/config.vim
