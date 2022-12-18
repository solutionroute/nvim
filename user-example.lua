-- user customization; copy this file to user.lua and adapt as you need.

-- OPTIONS
local opt = vim.opt
opt.relativenumber = false -- Show relative numberline (default is false)
opt.undofile = false -- Enable persistent undo (default is true)

-- MAPPINGS
-- <Leader> is mapped to <Space> by default
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command
local map = vim.keymap.set
-- default only maps C-s in Normal mode
map("i", "<C-s>", "<esc><cmd>write<CR>", {desc = "write buffer"}) -- same as <Leader>w

-- COLORSCHEMES (browse with <Leader>sc)
-- If a theme has options, set before the colorscheme cmd, i.e.:

-- vim.g.material_style = "palenight"
-- vim.g.material_style = "darker" -- system default
-- vim.cmd 'colorscheme material'

-- others:
-- vim.cmd 'colorscheme nightfox' 
-- vim.cmd 'colorscheme nordfox'
-- vim.cmd 'colorscheme terafox' -- also many other foxes available
-- vim.cmd 'colorscheme onedark'
-- vim.cmd 'colorscheme tokyonight-night'
-- vim.cmd 'colorscheme darkplus'

