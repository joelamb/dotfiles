-- Set color theme of nvim-tree
vim.highlight.create('NvimTreeNormal', {guibg='#f9f9f9'}, false)

vim.opt.termguicolors = true
vim.opt.background = "light"

vim.cmd [[
try
  colorscheme one
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
