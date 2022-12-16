-- https://github.com/nvim-tree/nvim-tree.lua
local ok, m = pcall(require, "nvim-tree")
if not ok then
  return
end

-- disabled at nvim/lua/init.lua but here too in case that gets mucked with
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

m.setup({
  renderer = {
    highlight_git = true
  },
  update_focused_file = {
    enable = true
  },
})
