-- https://github.com/solutionroute/nvim 
-- An understandable Neovim configuration meant for code and general purpose
-- editing.

-- nvim-tree: disable netrw at start to avoid race condition 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
  vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0.8 or greater", "error") end)
else
  -- all modules in core are loaded by plugins after packer has been initialized
  require('core.plugins')

  -- To override defaults:
  -- copy user_example.lua -> user.lua, and set within it your preferred colour
  -- scheme, options, and mappings.
  local user_config = vim.fn.stdpath('config') .. '/user.lua'
  local f = io.open(user_config)
  if f then
    f:close()
    vim.cmd('luafile '..user_config)
  end
end

