require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "css", "go", "gomod", "html", "javascript", "lua", "rust", "ruby", "svelte", "toml", "typescript", "vim", "vue", },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
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
