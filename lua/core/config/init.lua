-- nvim/lua/core/config/init.lua
-- for simple one-liners, if needed, include them here:
require("lsp_signature").setup{doc_lines=0, hint_enable=false}
require("nvim-autopairs").setup{}
require("nvim-lastplace").setup{}
require('telescope').setup()
require('which-key').setup() -- mappings are in core/mappings.lua

-- More complex config/setup go in individual files under core/config/...
require('core.config.bufferline')
require('core.config.cmp')
require('core.config.comment')
require('core.config.colorizer')
require('core.config.gitsigns')
require('core.config.indent-blankline')
require('core.config.lsp')
require('core.config.lualine')
require('core.config.nvim-tree')
require('core.config.treesitter')
