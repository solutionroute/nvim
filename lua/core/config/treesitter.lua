-- https://github.com/nvim-treesitter/nvim-treesitter
local ok, m = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

m.setup {
  -- A list of parser names, or "all"; note, some parsers require Nodejs / npm - see our README.md
  -- ensure_installed = "all",
  ensure_installed = {
    "bash", "c", "css", "go", "gomod", "help", "html", "javascript", "json", "lua",
    "markdown", "make", "python", "svelte", "toml", "typescript", "vim", "vue", "yaml" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- configuration for certain other plugins relying on tree-sitter
  autopairs = {
   enable = true,
  },
  -- https://github.com/windwp/nvim-ts-autotag
  autotag = {
    enable = true,
    incremental_selection = { enable = true },
    indent = { enable = false },
  },
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
