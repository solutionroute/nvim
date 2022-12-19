-- https://github.com/solutionroute/nvim 
--
-- An understandable Neovim configuration aiming for simplicity but not at the
-- expense of capabilities, meant for code and general purpose editing.
--
-- To override defaults:
-- 
--   Copy nvim/user_example.lua -> nvim/user.lua, and within that file set your
--   preferred colour scheme, options, and mappings.
--
-- New to Lua/Lua in nvim? Check out: 
--
--   https://github.com/nanotee/nvim-lua-guide
--   https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- system level items that should be set before plugins are loaded
-- nvim-tree: disable netrw at startup to avoid race condition 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set <Space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- plugins occasionally need fairly current versions
local min_minor = 8 -- nvim-0.8+

if vim.version().minor >= min_minor or vim.version().prerelease then
  -- core/init.lua contains packer init and loads other core modules when not bootstrapping
  require('core')

  -- only load user customizaions when not bootstrapping
  -- if package.loaded['core.options'] then
  --   local user_config = vim.fn.stdpath('config') .. '/user.lua'
  --   local f = io.open(user_config)
  --   if f then
  --     f:close()
  --     vim.cmd('luafile '..user_config)
  --   end
  -- end
else
  vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0."..min_minor.."+ or nightly release.", "error") end)
end

