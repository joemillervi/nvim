local builtin = require('telescope.builtin')

-- all file search
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- git file search
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)
