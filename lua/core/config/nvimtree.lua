local ok, m = pcall(require, "nvim-tree")
if not ok then
  return
end

m.setup({
  renderer = { highlight_git = true },
  update_focused_file = { enable = true },
})

-- prevents nvim-tree from setting up a contrasting bg colour for itself
vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
-- when switching colorscheme on the fly, applies the fix again
vim.api.nvim_create_autocmd("ColorScheme", {
    command = "hi NvimTreeNormal guibg=NONE ctermbg=NONE",
	group = vim.api.nvim_create_augroup("nvimtree_nobg", {clear = true})
})
