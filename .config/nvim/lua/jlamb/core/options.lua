vim.cmd("let g:netrw_liststyle = 3")

local options = {
	fileencoding = "utf-8",

	-- System undo levels
	backup = false,
	swapfile = false,
	undofile = true,
	undolevels = 100,

	-- Line numbers
	number = true,
	numberwidth = 2,
	relativenumber = true,
	signcolumn = "yes",

	-- Stop word wrapping
	wrap = false,
  backspace = "indent,eol,start",

	-- Hide buffers
	hidden = true,

	-- Status line
	laststatus = 0,
  showmode = false,

  -- Find the cursor
  cursorline = true,

	-- Scroll padding
	scrolloff = 4,
	mouse = "a",
	ttyfast = true,

	-- Indentations
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	smartindent = true,
	autoindent = true,

	-- Windows
	splitbelow = true,
	splitright = true,

	-- Clipboard
	clipboard = "unnamedplus",

	-- Easier to read JSON and Markdown
	conceallevel = 0,

	-- Search
	ignorecase = true,
	smartcase = true,
	hlsearch = true,
	showmatch = true,

	-- Misc
	title = true,
	confirm = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
