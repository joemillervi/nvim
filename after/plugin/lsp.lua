local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require("mason").setup({
	ensure_installed = { "prettierd", "stylua" },
})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "tsserver", "pylsp", "lua_ls", "angularls" },
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()

-- additional remaps here
local cmp = require("cmp")
cmp.setup({
	mapping = {
		-- Press Enter to accept suggestion
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
})

-- Map Ctrl+[ to show references
vim.api.nvim_set_keymap("n", "<C-[>", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
-- Map ] to show definition
vim.api.nvim_set_keymap("n", "<C-]>", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- Map ] to show type definition
vim.api.nvim_set_keymap("n", "<C-\\>", ":lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })

-- close quickfix menu after selecting choice with <Enter>
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

-- close quickfix menu when pressing <Esc>
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <Esc> <Esc>:cclose<CR>]],
})

vim.diagnostic.config({
	virtual_text = false,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- TODO fix this shit
-- some reason the Esc key is remapped to check references
-- this fix unmaps it from that
-- :unmap <Del>
vim.api.nvim_del_keymap("n", "<Esc>")
