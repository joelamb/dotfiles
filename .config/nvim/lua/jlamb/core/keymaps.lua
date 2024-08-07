local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map leader to spacebar
-- keymap("", "<Space>", "<Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"

-- better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)

-- close window shortcut
keymap("n", "<C-q>", "<C-w>c", opts)

-- split window shortcut
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)

-- buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", opts)
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", opts)
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", opts)
keymap("n", "<leader>tn", "<cmd>tabn<CR>", opts)
keymap("n", "<leader>tp", "<cmd>tabp<CR>", opts)

-- save shortcut
keymap("n", "<leader>s", ":w<CR>", opts)

-- move current line
keymap("n", "<leader>k", ":move -2<CR>", opts) -- up
keymap("n", "<leader>j", ":move +1<CR>", opts) -- down

-- visual: stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Nvim Tree
keymap("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<leader>ec", ":NvimTreeCollapse<CR>", opts)

-- Search
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<cr>", opts)

-- Formatting
keymap("n", "<leader>lf", ":EslintFixAll<CR>", opts)
