local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-p>", ui.nav_prev)
vim.keymap.set("n", "<C-n>", ui.nav_next)

vim.keymap.set("n", "<C-j>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-k>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-l>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-;>", function()
	ui.nav_file(4)
end)

-- increase width
require("harpoon").setup({
	global_settings = {
		mark_branch = true,
	},
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
})

-- use l to enter into a file
function set_harpoon_keymap()
    -- Check if the buffer's filetype is 'harpoon'
    if vim.bo.filetype == 'harpoon' then
        vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<Cmd>lua require("harpoon.ui").select_menu_item()<CR>', { noremap = true, silent = true })
    end
end
vim.api.nvim_command('augroup HarpoonOverride')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType * lua set_harpoon_keymap()')
vim.api.nvim_command('augroup END')

