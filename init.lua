-- Neovim configuration meant to be simple, understandable yet functional
-- https://github.com/solutionroute/nvim

-- Key mappings there are tend to mirror Lunarvim. <Leader>sk to check them out.

-- File layout:
-- nvim/
-- ├── after -> ../lvim/after
-- ├── init.lua
-- ├── lua
-- │   └── config
-- │       ├── cmp.lua
-- │       ├── colorscheme.lua
-- │       ├── goyo.lua
-- │       ├── lualine.lua
-- │       ├── mappings.lua
-- │       ├── nvim-tree.lua
-- │       ├── plugins.lua
-- │       ├── settings.lua
-- │       ├── telescope.lua
-- │       ├── toggleterm.lua
-- │       └── treesitter.lua
-- ├── plugin
-- │   └── packer_compiled.lua
-- └── README.md

-- core
-- require('config.plugins')
-- require('config.settings')
-- require('config.mappings')

-- -- plugin configs
-- require('config.colorscheme')
-- require('config.lualine')
-- require('config.nvim-tree')
-- require('config.cmp')
-- require('config.toggleterm')
-- require('config.treesitter')

-- path for user overrides

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
    vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0.8 or greater", "error") end)
else
    require('core')
    -- lua/user.lua is not part of this repo and can be used as a per-user override
    local user_overrides = vim.fn.stdpath('config') .. '/lua/user.lua'
    local f = io.open(user_overrides)
    if f then
        f:close()
        require('user')
    end
end
