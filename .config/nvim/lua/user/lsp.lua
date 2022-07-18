local lsp = require('lspconfig')

local servers = {
  --------------
  -- Languages
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  --------------
  -- Frameworks
  "ember",
  --------------
  -- Tools
  "tailwindcss",
  --------------
  -- Linting
  "eslint",
}

local mySettings = {
  eslint = {
    format = true,
  },
  sumneko_lua = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data
      telemetry = {
        enable = false,
      },
    }
  }
}

require("nvim-lsp-installer").setup {
  ensure_installed = servers,
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    }
  }
}

vim.opt.spelllang = { 'en_us' }

-- Setup lspconfig
local capabilities = require("cmp_nvim_lsp")
  .update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end
  
for _, serverName in ipairs(servers) do
  local server = lsp[serverName]

  if (server and (server ~= "tsserver")) then
    server.setup({
      capabilities = capabilities,
      settings = mySettings[serverName],
      on_attach = function(client, bufnr)
        if client.name == "eslint" then
          client.server_capabilities.document_formatting = true
        end
        lsp_keymaps(bufnr)
        lsp_highlight_document(client)
      end
    })
  end
end

-- Change diagnostic symbols in the sign column (gutter)
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  -- virtual text makes things pretty claustrophobic
  --  would be great to only turn on/off for certain diagnostics providers tho
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    show_header = false,
    source = true,
    border = 'rounded',
    -- So we can copy-paste errors to chat
    focusable = true,
  },
})

