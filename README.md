# nvim
A simple, hopefully understandable, Neovim configuration in Lua.

## Features

- Not too many features but enough for comfortable Go, HTML, CSS, Javascript
  and Markdown work
- Auto-plugin-install via Packer
- Language support via Mason and others; some Go tweaks
- Git integration
- Auto completion
- Telescope
- Whichkey menus

## Installation

    # in your ~/.config consider keeping your existing
    cd ~/.config
    mv nvim nvim-your-backup
    git clone https://github.com/solutionroute/nvim.git nvim-solutionroute
    ln -sv nvim-solutionroute nvim
    nvim +PackerClean +PackerSync

## Use 

The `<Leader>` key is space. Whichkey menus guide the user (Dec 11 2022 still
defining some core mappings).

## Customization

If you want to override options or mappings while still tracking this repo,
this can be done by copying `lua/user-example.lua` to `lua/user.lua`; place
your customizations there.

## File Layout

Keeping it simple is the plan. See core/config/init.lua in particular.

    .
    ├── init.lua
    ├── LICENSE
    ├── lua
    │   ├── core
    │   │   ├── config
    │   │   │   ├── cmp.lua
    │   │   │   ├── colorizer.lua
    │   │   │   ├── gitsigns.lua
    │   │   │   ├── indent-blankline.lua
    │   │   │   ├── init.lua
    │   │   │   ├── lsp.lua
    │   │   │   ├── lualine.lua
    │   │   │   ├── nvim-tree.lua
    │   │   │   ├── telescope.lua
    │   │   │   └── treesitter.lua
    │   │   ├── init.lua
    │   │   ├── mapping.lua
    │   │   ├── options.lua
    │   │   └── plugins.lua
    │   └── user-example.lua
    └── README.md
