-- nvim/lua/core/config/colorscheme.lua
-- pre-configure, if needed, system colorscheme defaults

-- Material
vim.g.material_style = "darker"
require('material').setup({
    contrast = {
        cursor_line = true
    },
    styles = {
        comments = { italic = true, },
    },
    plugins = {
        'gitsigns',
        'indent-blankline',
        'nvim-cmp',
        'nvim-notify',
        'nvim-tree',
        'nvim-web-devicons',
        'telescope',
        'which-key',
    },
})

-- Nightfox
require('nightfox').setup({
    options = {
        dim_inactive = true,
        transparent = true,
        styles = {
            comments = "italic",
            -- keywords = "bold",
            -- types = "italic,bold",
        }
    },
    palettes = {
        nordfox = { bg1 = "#20242c", -- #2e3440 is the original
        },
    }
})

-- system default colourscheme; see nvim/user-example for others.
vim.cmd 'colorscheme nordfox' -- default for this repo
