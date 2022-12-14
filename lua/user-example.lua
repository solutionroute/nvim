-- user overrides; copy this file to user.lua and adapt as you need.
-- options
local opt = vim.opt
opt.relativenumber = true -- Show relative numberline (default is false)

-- mappings
-- <Leader> is mapped to <Space> by default
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command
local map = vim.keymap.set
-- default only maps C-s in Normal mode
map("i", "<C-s>", "<esc><cmd>write<CR>", {desc = "write buffer"}) -- same as <Leader>w
