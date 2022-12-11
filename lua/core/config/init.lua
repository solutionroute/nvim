-- nvim/lua/core/config/init.lua

-- for simple one-liners, include them here:
require("bufferline").setup{}
require('Comment').setup()
require("nvim-autopairs").setup{}
require("nvim-lastplace").setup{}
require('which-key').setup() -- mappings are (mostly) in core/mappings.lua

-- More complex config/setup go in individual files under config
require('core.config.cmp') -- lsp related
require('core.config.colorizer')
require('core.config.gitsigns')
require('core.config.indent-blankline')
require('core.config.lsp')
require('core.config.lualine')
require('core.config.nvim-tree')
require('core.config.telescope')
require('core.config.treesitter')
