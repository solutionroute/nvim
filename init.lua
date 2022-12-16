-- https://github.com/solutionroute/nvim 
-- A simple and understandable Neovim configuration meant for code and general
-- purpose editing.

-- nvim-tree: disable at start to avoid race condition 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
  vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0.8 or greater", "error") end)
else
  require('core')
  -- nvim/lua/user.lua is not part of this repo; create & use as your override for
  -- package default options and mappings; see or copy user_example.lua
  local user_overrides = vim.fn.stdpath('config') .. '/lua/user.lua'
  local f = io.open(user_overrides)
  if f then
    f:close()
    require('user')
  end
end

