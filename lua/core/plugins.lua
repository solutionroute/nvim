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
  use 'lunarvim/darkplus.nvim' -- default
  use 'EdenEast/nightfox.nvim'
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'marko-cerovac/material.nvim'

  -- user interface
  -- icons used by nvim-tree, tabs/bufferline/lualine
  use 'nvim-tree/nvim-web-devicons'
  -- tabs/buffers
  use {'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-web-devicons'}
  -- status line
  use {'nvim-lualine/lualine.nvim', requires = 'nvim-web-devicons'}
  -- highlight rgb colour strings like #ffcc33
  use {'NvChad/nvim-colorizer.lua', config = function() require('colorizer').setup{} end }
  -- dynamic menus based on mappings
  use {'folke/which-key.nvim', config = function() require('which-key').setup{} end }
  -- restore cursor position in file
  use {'ethanholz/nvim-lastplace', config = function() require('nvim-lastplace').setup{} end }
  -- commenting
  use 'numToStr/Comment.nvim'
  -- automatic session save
  use({ "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
    require("persistence").setup()
    end,
  })
  -- match braces, brackets and such
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end }
  -- indent lines, configured to highlight current block
  use {'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup{
        show_current_context = true,
        show_current_context_start = false,
      }
    end
  }
  -- git integration
  use('tpope/vim-fugitive')
  use {'lewis6991/gitsigns.nvim', requires = 'folke/which-key.nvim'}
  -- file browsing 
  use 'nvim-tree/nvim-tree.lua'
  -- quick find... anything
  use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('telescope').setup{} end }

  -- Treesitter & LSP Support
  -- code highlighting and more
  use {'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- treesitter dependent, see treesitter config
  use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'} -- Context based commenting
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} -- like autopairs but for html and more, config in treesitter
  use { "RRethy/vim-illuminate", after = 'nvim-treesitter'} -- highlight like terms (uses ts/lsp/regex)

  -- Zero (almost) configuration of LSP
  use {'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  -- function signature display as you type
  use {'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup{doc_lines=0, hint_enable=false}
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
