-- nvim/lua/core/config/init.lua
-- Only more complex configurations get their own module; the balance
-- are found within nvim/lua/core/init.lue with the plugin declarations.
require('core.config.comment')
require('core.config.colorscheme')
require('core.config.gitsigns')
require('core.config.treesitter')
require('core.config.zerolsp')
