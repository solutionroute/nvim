-- user overrides; copy this file to user.lua and adapt as you need.
-- options
local opt = vim.opt
opt.relativenumber = false -- Show relative numberline (default is false)
opt.undofile = false -- Enable persistent undo (default is true)

-- mappings
-- <Leader> is mapped to <Space> by default
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command
local map = vim.keymap.set
-- default only maps C-s in Normal mode
map("i", "<C-s>", "<esc><cmd>write<CR>", {desc = "write buffer"}) -- same as <Leader>w

-- colorschemes (browse with <Leader>sc)
-- vim.cmd 'colorscheme darkplus' -- default
-- vim.cmd 'colorscheme catppuccin-mocha' -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd 'colorscheme tokyonight-night'

-- If a theme has options, set before the colorscheme cmd, i.e.:

-- Material:
vim.g.material_style = "darker"
vim.cmd 'colorscheme material'

-- Nord:
-- vim.g.nord_disable_background = true
-- vim.g.nord_italic = false
-- vim.g.nord_cursorline_transparent = true
-- vim.g.nord_contrast = true
-- vim.cmd 'colorscheme nord'
--

-- Nightfox:
-- require('nightfox').setup({
--   options = {
--     transparent = true,
--     styles = {
--       comments = "italic",
--       -- keywords = "bold",
--       -- types = "italic,bold",
--     }
--   }
-- })
-- vim.cmd 'colorscheme nightfox'
