-- nvim/core/init.lua
--
-- This script:
--
-- 1. Defines all core plugins
-- 2. Bootstraps packer, if necessary, on first load
-- 3. Executes itself again whenever this file is saved to d/l or clean up plugins
-- 4. At the end, loads the core/* module configurations plus the default
--    autocommands, mapping and options.
--
-- Plugin configuration:
--
-- 1. Packages with very simple configuration needs are configured here
-- 2. Colorscheme plugins are to be configured in a user.lua, if needed
-- 3. For anything more than boilerplate plugin setup{}, configs are placed in
--    in core/config/*

-- These globals set at the start to ensure plugins follow suit
-- nvim-tree: disable netrw at startup to avoid race condition 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set <Space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- 'data' on *nix systems is $HOME/.local/share/nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = { clone_timeout = 300, }, -- Timeout (s)
}

-- Because friends don't subject friends to "default" and unreadable magenta
-- popup windows, not even for bootstrapping
if vim.g.colors_name == nil then
  vim.o.termguicolors = true
  vim.cmd [[colorscheme slate]]
end

require('core.options') -- nvim options
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer manages itself

  -- this one plugin keeps the rest of the config simpler
  use { 'VonHeikemen/lsp-zero.nvim', -- Zero (almost) configuration of LSP and completion
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { 'ray-x/lsp_signature.nvim', -- function signature display as you type
    config = function()
      require('lsp_signature').setup { doc_lines = 0, hint_enable = false }
    end
  }

  use 'numToStr/Comment.nvim' -- commenting

  use { 'nvim-treesitter/nvim-treesitter', -- powers many code highlighting/editing/nav plugins
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- These three are configured within config.treesitter:
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' } -- Context based commenting
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- like autopairs but for html and more, config in treesitter
  use { "RRethy/vim-illuminate", after = 'nvim-treesitter' } -- highlight like terms (uses ts/lsp/regex)

  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end } -- match braces, brackets such

  use { 'lukas-reineke/indent-blankline.nvim', -- code indentation/block identification
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = false,
        show_trailing_blankline_indent = false,
      }
    end }

  use('tpope/vim-fugitive') -- git integration via cmd "G" cmd
  use { 'lewis6991/gitsigns.nvim', requires = 'folke/which-key.nvim' } -- git dignostics and keymaps

  use 'nvim-tree/nvim-web-devicons' -- icons used by many plugins

  -- quick find... anything!
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('telescope').setup {} end }
  -- file browsing  (<Leader>e...) for the times when a tree view is useful
  use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons', }, tag = 'nightly', }

  -- status line (and winboar short titles)
  use { 'feline-nvim/feline.nvim',
    config = function()
      require('feline').setup()
      require('feline').winbar.setup()
    end,
    requires = 'nvim-web-devicons' }

  use { 'folke/which-key.nvim', config = function() require('which-key').setup {} end } -- dynamic menus derived from key mappings

  use { 'ethanholz/nvim-lastplace', config = function() require('nvim-lastplace').setup {} end } -- restore cursor position in file on re-open

  use({ "folke/persistence.nvim", -- automatic "session" save; session restore is human driven (<Leader>q...)
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })
  -- highlight rgb colour strings like #ffcc33
  use { 'NvChad/nvim-colorizer.lua', config = function() require('colorizer').setup {} end }

  -- colour schemes: put any needed configuration in user.lua override
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'lunarvim/darkplus.nvim'
  use 'navarasu/onedark.nvim'
  use 'marko-cerovac/material.nvim'

  -- Simple but workable user customization
  -- copy the user-plugins-example.lua file to nvim/lua/user/plugins.lua
  local ok, user_plugins = pcall(require, 'user.plugins')
  if ok then
    user_plugins(use)
  end

  -- all plugins defined, update or install:
  if is_bootstrap then
    require("packer").sync()
  end
end)

-- reload and run PackerSync whenever this file is saved
vim.cmd [[
  augroup plugins_saved
    autocmd!
    autocmd BufWritePost */core/init.lua source <afile> | PackerSync
  augroup end
]]

if is_bootstrap then -- avoid loading core modules before restart
  print '                                          '
  print '                     d8b                  '
  print '                     Y8P                  '
  print '                                          '
  print '    8888b.  888  888 888 88888b.d88b.     '
  print '    88 "88b 888  888 888 888 "888 "88b    '
  print '    88  888 Y88  88P 888 888  888  888    '
  print '    88  888  Y8bd8P  888 888  888  888    '
  print '    88  888   Y88P   888 888  888  888    '
  print '                                          '
  print '            Bootstrapping nvim            '
  print '                                          '
  print '     When Packer finishes installing      '
  print '     plugins, quit and restart nvim.      '
  print '                                          '
  print '     Create ~/.config/nvim/user.lua       '
  print '     for your choice of colourscheme,     '
  print '     options, and key mappings.           '
  print '                                          '
  print '   https://github.com/solutionroute/nvim  '
  print '                                          '
  return
end

-- finally, we load the core modules, options, mapping and autocommands.
-- These are not loaded if we've just bootstrapped packer
require('core.options') -- nvim options
require('core.config') -- configuration for plugins
require('core.mapping') -- key maps and menus, mostly driven by which-key
require('core.autocommands') -- autocommands with no better place to go
-- last, protected calls to require user.config which may not be present
pcall(require, 'user.config')
-- nvim/core/init.lua
--
-- This script:
--
-- 1. Defines all core plugins
-- 2. Bootstraps packer, if necessary, on first load
-- 3. Executes itself again whenever this file is saved to d/l or clean up plugins
-- 4. At the end, loads the core/* module configurations plus the default
--    autocommands, mapping and options.
--
-- Plugin configuration:
--
-- 1. Packages with very simple configuration needs are configured here
-- 2. Colorscheme plugins are to be configured in a user.lua, if needed
-- 3. For anything more than boilerplate plugin setup{}, configs are placed in
--    in core/config/*

-- 'data' on *nix systems is $HOME/.local/share/nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = { clone_timeout = 300, }, -- Timeout (s)
}

-- Because friends don't subject friends to "default" and unreadable magenta
-- popup windows, not even for bootstrapping
if vim.g.colors_name == nil then
  vim.o.termguicolors = true
  vim.cmd [[colorscheme slate]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer manages itself

  use { 'VonHeikemen/lsp-zero.nvim', -- Zero (almost) configuration of LSP
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { 'ray-x/lsp_signature.nvim', -- function signature display as you type
    config = function()
      require('lsp_signature').setup { doc_lines = 0, hint_enable = false }
    end
  }

  -- commenting
  use 'numToStr/Comment.nvim'

  use { 'nvim-treesitter/nvim-treesitter', -- powers many code highlighting/editing/nav plugins
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- configured within treesitter:
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' } -- Context based commenting
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- like autopairs but for html and more, config in treesitter
  use { "RRethy/vim-illuminate", after = 'nvim-treesitter' } -- highlight like terms (uses ts/lsp/regex)

  -- match braces, brackets such
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }

  -- code indentation/block identification
  use { 'lukas-reineke/indent-blankline.nvim', -- indent lines, configured to highlight current block
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = false,
        show_trailing_blankline_indent = false,
      }
    end }

  -- git integration
  use('tpope/vim-fugitive')
  use { 'lewis6991/gitsigns.nvim', requires = 'folke/which-key.nvim' }

  -- icons used by so many plugins
  use 'nvim-tree/nvim-web-devicons'

  use { 'feline-nvim/feline.nvim', -- status line
    config = function()
      require('feline').setup()
      require('feline').winbar.setup() -- puts a small window title up
    end,
    requires = 'nvim-web-devicons' }

  -- dynamic menus based on mappings
  use { 'folke/which-key.nvim', config = function() require('which-key').setup {} end }

  -- restore cursor position in file on re-open
  use { 'ethanholz/nvim-lastplace', config = function() require('nvim-lastplace').setup {} end }
  -- automatic session save; session restore is human driven (<Leader>q...)
  use({ "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  -- quick find... anything; m
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function() require('telescope').setup {} end }

  -- file browsing  (<Leader>e...) prefer using Telescope, are times when a tree view can be useful
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    config = function()
      require('neo-tree').setup({
        source_selector = { winbar = true, },
        use_libuv_file_watcher = true,
      })
    end }

  -- highlight rgb colour strings like #ffcc33
  use { 'NvChad/nvim-colorizer.lua', config = function() require('colorizer').setup {} end }

  -- colour schemes: put any needed configuration in user.lua override
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'lunarvim/darkplus.nvim'
  use 'navarasu/onedark.nvim'
  use 'marko-cerovac/material.nvim'

  -- Simple but workable user customization
  -- copy the user-plugins-example.lua file to nvim/lua/user/plugins.lua
  local ok, user_plugins = pcall(require, 'user.plugins')
  if ok then
    user_plugins(use)
  end

  if is_bootstrap then
    require("packer").sync()
  end
end)

-- reload and run PackerSync whenever this file is saved
vim.cmd [[
  augroup plugins_saved
    autocmd!
    autocmd BufWritePost */core/init.lua source <afile> | PackerSync
  augroup end
]]

if is_bootstrap then -- avoid loading core modules before restart
  print '                                          '
  print '                     d8b                  '
  print '                     Y8P                  '
  print '                                          '
  print '    8888b.  888  888 888 88888b.d88b.     '
  print '    88 "88b 888  888 888 888 "888 "88b    '
  print '    88  888 Y88  88P 888 888  888  888    '
  print '    88  888  Y8bd8P  888 888  888  888    '
  print '    88  888   Y88P   888 888  888  888    '
  print '                                          '
  print '            Bootstrapping nvim            '
  print '                                          '
  print '     When Packer finishes installing      '
  print '     plugins, quit and restart nvim.      '
  print '                                          '
  print '     Create ~/.config/nvim/user.lua       '
  print '     for your choice of colourscheme,     '
  print '     options, and key mappings.           '
  print '                                          '
  print '   https://github.com/solutionroute/nvim  '
  print '                                          '
  return
end

-- finally, we load the core modules, options, mapping and autocommands.
-- These are not loaded if we've just bootstrapped packer
require('core.config') -- configuration for plugins
require('core.options') -- nvim options
require('core.mapping') -- key maps and menus, mostly driven by which-key
require('core.autocommands') -- autocommands with no better place to go
-- last, protected calls to require user.config which may not be present
pcall(require, 'user.config')
