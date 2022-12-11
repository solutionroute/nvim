require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>fr', builtin.oldfiles, {}) -- recent
vim.keymap.set('n', '<Space>fp', builtin.find_files, {}) -- "project" 
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {}) -- grep
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {}) -- help
