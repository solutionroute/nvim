-- https://github.com/nvim-treesitter/nvim-treesitter
local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",
  -- ensure_installed = { "bash", "c", "css", "go", "gomod", "html", "javascript", "lua", "rust", "ruby", "svelte", "toml", "typescript", "vim", "vue", },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- configuration for certain other plugins relying on tree-sitter
  -- nvim-ts-rainbow https://github.com/p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true, -- match non brace related delimeters like html tags
  },
  -- https://github.com/windwp/nvim-ts-autotag
  autotag = {
    enable = true,
  }
}
