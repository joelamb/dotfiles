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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

-- close window shortcut
keymap("n", "<C-q>", "<C-w>c", opts)

-- split window shortcut
keymap("n", "<leader>v", ":vsplit<CR>", opts)


-- buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":Bdelete<CR>", opts)
keymap("n", "<leader><leader>", "C-^", opts) -- reopen closed buffer

-- save shortcut
keymap("n", "<leader>s", ":w<CR>", opts)

-- move current line
keymap("n", "<leader>k", ":move -2<CR>", opts) -- up
keymap("n", "<leader>j", ":move +1<CR>", opts) -- down

-- visual: stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Nvim Tree
keymap("n", "<leader><tab>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFocus<CR>", opts)

-- Which Key
keymap("n", "<leader>?", ":WhichKey<CR>", opts)

-- Search
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Telescope
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fr", ":Telescope registers<cr>", opts)
keymap("n", "<leader>fs", ":Telescope spell_suggest<cr>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<cr>", opts)

-- Formatting
keymap("n", "<leader>lf", ":EslintFixAll<CR>", opts)
