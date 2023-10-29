vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- This option determines the number of spaces a tab (\t) character occupies in the editor.
vim.opt.tabstop = 2

-- softtabstop determines how many columns the text is to be shifted when you
-- press the tab key or the backspace key in the insert mode.
vim.opt.softtabstop = 2

-- This setting is used for operations like >>, <<, ==, etc.
-- which increase, decrease, or correct indentation levels.
-- When you set shiftwidth to 2, it means that using these operations will shift lines by 2 columns.
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
