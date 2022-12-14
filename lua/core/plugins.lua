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
  -- colour schemes
  use 'lunarvim/darkplus.nvim'
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  -- file browsing 
  use 'nvim-tree/nvim-tree.lua'
  -- icons used by nvim-tree, tabs/bufferline/lualine
  use 'nvim-tree/nvim-web-devicons'
  -- restore cursor position in file
  use 'ethanholz/nvim-lastplace'
  -- quick find... anything
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- tabs/buffers
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-web-devicons'}
  -- status line
  use {'nvim-lualine/lualine.nvim', requires = 'nvim-web-devicons'}
  -- dynamic menus based on mappings
  use 'folke/which-key.nvim'
  -- code highlighting and more
  use 'nvim-treesitter/nvim-treesitter'
  -- treesitter dependent: 
  use {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'} -- highlight for brackets, html tags
  use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'} -- Context based commenting
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} -- like autopairs but for html and more, config in treesitter
  -- indent lines, configured to highlight current block
  use 'lukas-reineke/indent-blankline.nvim'
  -- highlight rgb colour strings like #ffcc33
  use 'NvChad/nvim-colorizer.lua'
  -- match braces, brackets and such
  use 'windwp/nvim-autopairs'
  -- commenting
  use 'numToStr/Comment.nvim'
  -- git integration
  use {'lewis6991/gitsigns.nvim', require = 'folke/which-key.nvim'}

  -- LSP provision and completion; configured in config.lsp.lua
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-null-ls.nvim",
  }
  --auto complete, required for LSP
  use {'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  --
  'hrsh7th/cmp-vsnip',
  -- configure or dump below
  -- "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-cmdline",
  -- "hrsh7th/nvim-cmp",
  }
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  -- Colorschemes

  -- cmp plugins
--  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  -- use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  -- use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
--   use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
 --  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  -- use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- use { "neovim/nvim-lspconfig" }
  -- use { "hrsh7th/cmp-nvim-lsp" }
  -- use { "hrsh7th/cmp-buffer" }
  -- use { "hrsh7th/cmp-path" }
  -- use { "hrsh7th/cmp-cmdline" }
  -- use { "hrsh7th/nvim-cmp" }

  -- a snippet engine is mandatory for cmp-* completions
  -- use { "hrsh7th/cmp-vsnip" }
  -- use { "hrsh7th/vim-vsnip" }

  -- snippets
--  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
--  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  -- -- use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  -- use { "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f"}
  -- use { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" }
  -- use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
--   use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }

  -- Telescope
--   use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }

  -- Treesitter
  -- use { "nvim-treesitter/nvim-treesitter", --     commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
  -- }

  -- Git
--   use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }

  -- DAP
--   use { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
--   use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
--   use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
