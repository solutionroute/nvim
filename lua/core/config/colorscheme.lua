-- nvim/lua/core/config/colorscheme.lua
-- pre-configure, if needed, system colorscheme defaults

-- Material
vim.g.material_style = "darker"
require('material').setup({
  styles = {
      comments = {italic = true,},
  },
  plugins = {
    'gitsigns',
    'indent-blankline',
    'nvim-cmp',
    'nvim-web-devicons',
    'telescope',
    'which-key',
  },
})

-- Nightfox
require('nightfox').setup({
  options = {
    transparent = false,
    styles = {
      comments = "italic",
      -- keywords = "bold",
      -- types = "italic,bold",
    }
  },
  palettes = {
    -- #2e3440 is the original
    nordfox = {bg1="#20242d",},
  }
})

-- system default colourscheme; see nvim/user-example for others.
vim.cmd 'colorscheme material' -- default for this repo