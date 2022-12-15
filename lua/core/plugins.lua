local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer manages itself
  -- misc functions used by some plugins
  use 'nvim-lua/plenary.nvim'
  -- file browsing 
  use 'nvim-tree/nvim-tree.lua'
  -- icons used by nvim-tree, tabs/bufferline/lualine
  use 'nvim-tree/nvim-web-devicons'
  -- restore cursor position in file
  use 'ethanholz/nvim-lastplace'
  -- quick find... anything
  use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
  -- tabs/buffers
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-web-devicons'}
  -- status line
  use {'nvim-lualine/lualine.nvim', requires = 'nvim-web-devicons'}
  -- dynamic menus based on mappings
  use 'folke/which-key.nvim'
  -- code highlighting and more
  use 'nvim-treesitter/nvim-treesitter'
  -- treesitter dependent: 
  use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'} -- Context based commenting
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} -- like autopairs but for html and more, config in treesitter
  use { "RRethy/vim-illuminate", after = 'nvim-treesitter'} -- highlight like terms (uses ts/lsp/regex)
  -- indent lines, configured to highlight current block
  use 'lukas-reineke/indent-blankline.nvim'
  -- highlight rgb colour strings like #ffcc33
  use 'NvChad/nvim-colorizer.lua'
  -- match braces, brackets and such
  use 'windwp/nvim-autopairs'
  -- commenting
  use 'numToStr/Comment.nvim'
  -- git integration
  use {'lewis6991/gitsigns.nvim', requires = 'folke/which-key.nvim'}
  -- LSP provision and completion; configured in config.lsp.lua
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-null-ls.nvim",
  }
  -- symbols (vscode-like) for Lsp elements in completion dialogs
  use 'onsails/lspkind.nvim'
  -- completion engine, requires snippet engine and sources
  use 'hrsh7th/nvim-cmp'
  -- completion sources
  use {'hrsh7th/cmp-nvim-lsp', requires = 'nvim-cmp',}
  use {'hrsh7th/cmp-buffer', after = 'nvim-cmp',}
  use {'hrsh7th/cmp-path', after = 'nvim-cmp',}
  use {'hrsh7th/cmp-cmdline', after = 'nvim-cmp',}
  use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
  use {'saadparwaiz1/cmp_luasnip', wants = 'friendly-snippets', requires = 'LuaSnip'}

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use {'rafamadriz/friendly-snippets', opt = true}
  -- function signature display as you type
  use {'ray-x/lsp_signature.nvim'}
  -- colour schemes
  use 'lunarvim/darkplus.nvim'
  use 'folke/tokyonight.nvim' -- Dec 14 2022 failing
  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'marko-cerovac/material.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
