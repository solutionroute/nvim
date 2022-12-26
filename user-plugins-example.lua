-- user-plugins-example.lua

-- Copy this file (user-plugins-example.lua) to the user customization
-- directory:
--
--   cp $HOME/.config/nvim/user-plugins-example.lua $HOME/.config/nvim/lua/user/plugins.lua
--
-- Then restart nvim after changes AND run :PackerSync (<Leader>ps)
--
-- In this example we load via Packer the zen-mode plugin and map <Leader>z to it.

return function(use) use({ "folke/zen-mode.nvim", config = function()
    require("zen-mode").setup({})
    vim.keymap.set("n", "<Leader>z",
      "<cmd>ZenMode<cr>", { desc = "zen mode toggle" })
  end })
end
