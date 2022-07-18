-- Automatically install packer
--local fn = vim.fn
--local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
--if fn.empty(fn.glob(install_path)) > 0 then
--PACKER_BOOTSTRAP = fn.system {
  --"git",
  --"clone",
  --"--depth",
  --"1",
  --"https://github.com/wbthomason/packer.nvim",
  --install_path,
  --}
  --print "Installing packer close and reopen Neovim..."
  --vim.cmd [[packadd packer.nvim]]
--end

-- Reload Neovim on save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have Packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- have packer manage itself
	use("nvim-lua/popup.nvim") -- implementation of the popup API from vim in neovim
	use("nvim-lua/plenary.nvim") -- used by lots of plugins, inc. telescope
	use("kyazdani42/nvim-tree.lua") -- file explorer
	use("kyazdani42/nvim-web-devicons") -- icons for nvim-tree
  use("nanozuki/tabby.nvim") -- tab management
	use("moll/vim-bbye") -- close buffer without closing window
	use("folke/which-key.nvim") -- interactive cheatsheet
	--use "morhetz/gruvbox" -- colortheme
	use("rakr/vim-one") -- alt colortheme
	use("preservim/nerdcommenter") -- comments
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-telescope/telescope.nvim") -- fuzzy finder

	use({
		"hrsh7th/nvim-cmp", -- The completion plugin
		requires = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-nvim-lua", -- lua completions
		},
	})

	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- massive library of snippets

	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	use("jose-elias-alvarez/null-ls.nvim") -- linting

	use("ggandor/leap.nvim") -- better motion command
	--use "tpope/vim-repeat" -- extends dot repeat functionality
end)
