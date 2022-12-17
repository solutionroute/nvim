local ok, m = pcall(require, "lsp-zero")
if not ok then
  return
end

vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
m.preset('recommended')

m.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

m.nvim_workspace()

m.setup()
