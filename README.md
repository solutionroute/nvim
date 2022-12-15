# nvim

A keep-it-simple and understandable Neovim configuration meant for code and
general purpose editing.

- Track this repo; keep your own customizations separate in user.lua

## Installation

You'll want to backup (or rename) your existing `~/.config/nvim`; then:

    cd ~/.config
    git clone https://github.com/solutionroute/nvim.git nvim-solutionroute
    ln -sv nvim-solutionroute nvim
    nvim +PackerClean +PackerSync

You should be good to go; start `nvim`; you'll see treesitter and Mason
installing parsers and language servers on your first run only.

See <Leader>p for Packer commands and <Leader>l for LSP related commands such
as Mason.

## Customization

If you want to override options or mappings while still tracking this repo,
copy `lua/user-example.lua` to `lua/user.lua`; place your customizations there
and restart nvim.

## Quick Tips

- **Leader** and **menus**: The `<Leader>` key default is the space bar; hit
  the <Leader> key in normal mode to see menus provided by
  [folke/which-key.nvim](https://github.com/folke/which-key.nvim).

- **Common Mappings**: which-key also exposes menus in normal mode for common
  movement-related mappings such as y (yank), g (go), d (delete).

- **Clipboard**: Interacts with the system Clipboard, i.e. `ctrl-c` to copy
  text from a web browser, for example, can be pasted into your nvim buffer
  using the standard p or P keys.

## File Layout

Keeping it understandable is the plan. See core/config/init.lua in particular.

    ├── init.lua
    ├── LICENSE
    ├── lua
    │   ├── core
    │   │   ├── autocommands.lua
    │   │   ├── config
    │   │   │   ├── cmp.lua
    │   │   │   ├── colorizer.lua
    │   │   │   ├── gitsigns.lua
    │   │   │   ├── indent-blankline.lua
    │   │   │   ├── init.lua
    │   │   │   ├── lsp.lua
    │   │   │   ├── lualine.lua
    │   │   │   ├── nvim-tree.lua
    │   │   │   └── treesitter.lua
    │   │   ├── init.lua
    │   │   ├── mapping.lua
    │   │   ├── options.lua
    │   │   └── plugins.lua
    │   └── user-example.lua -- put your personal tweaks in user.lua & restart
    └── README.md

