-- user-config-example.lua
--
-- Copy this file (user-config-example.lua) to the user customization
-- directory;
--
--      cp $HOME/.config/nvim/user-config-example.lua \
--      $HOME/.config/nvim/lua/user/config.lua
--
-- Restart nvim after copying the file or any changes.
--
-- Example:
vim.opt.relativenumber = true -- Show relative numberline (default is false)
vim.opt.undofile = false -- Enable persistent undo (default is true)

-- <Leader> is mapped to <Space> by default
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command

vim.keymap.set("i", "<C-s>", "<cmd>write<CR>", { desc = "write buffer" }) -- same as <Leader>w

-- Colorschemes
-- ------------
-- This repo comes configured with a number of built-in and plugin themes; you
-- can explore them via Telescope using <Leader>sc.

-- If a theme has options, set before the colorscheme cmd, i.e.:

-- vim.g.material_style = "palenight"
-- vim.g.material_style = "darker" -- system default
-- vim.cmd 'colorscheme material

-- others simply need to be specified, i.e.:
-- vim.cmd 'colorscheme tokyonight-night'
-- vim.cmd 'colorscheme darkplus'
-- vim.cmd 'colorscheme onedark'
-- vim.cmd 'colorscheme nightfox'
-- vim.cmd 'colorscheme terafox'
-- vim.cmd 'colorscheme nordfox' -- this is the package's default
