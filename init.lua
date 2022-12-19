-- https://github.com/solutionroute/nvim 
--
-- An understandable Neovim configuration aimed at code editing.
--
-- You can track this repo while maintaining your own personalizations - check 
-- the example files for details.
--
-- New to Lua/Lua in nvim? Check out: 
--
--   https://github.com/nanotee/nvim-lua-guide
--   https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- These globals set at the start to ensure plugins follow suit
-- nvim-tree: disable netrw at startup to avoid race condition 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set <Space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- This project tracks the current stable
local min_minor = 8 -- nvim-0.8+

if vim.version().minor >= min_minor or vim.version().prerelease then
  -- core/init.lua contains packer init and loads other core modules 
  require('core')
else
  vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0."..min_minor.."+ or nightly release.", "error") end)
end

