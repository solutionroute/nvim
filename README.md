# nvim

                     d8b
                     Y8P

    8888b.  888  888 888 88888b.d88b.
    88 "88b 888  888 888 888 "888 "88b
    88  888 Y88  88P 888 888  888  888
    88  888  Y8bd8P  888 888  888  888
    88  888   Y88P   888 888  888  888

            Bootstrapping nvim

     When Packer finishes installing
     plugins, quit and restart nvim.

     Create ~/.config/nvim/user.lua
     for your choice of colourscheme,
     options, and key mappings.

   https://github.com/solutionroute/nvim

A keep-it-simple and understandable Neovim configuration in lua, meant for code
and general purpose editing.

## Installation

You'll want to backup (or rename) your existing `~/.config/nvim`; then:

    cd ~/.config
    git clone https://github.com/solutionroute/nvim.git nvim-solutionroute
    ln -sv nvim-solutionroute nvim
    # Run nvim; if you've used a Packer managed nvim before, there may be some
    # tidy proposed by packer.
    nvim 
    # allow nvim to install/cleanup any plugins, quit and restart nvim. Done.
    nvim

You should be good to go. This configuration will auto-install language servers
as needed when you open a filetype for the first time.

If you run into any issues in bootstrapping your new `nvim` these will likely
be due to leftovers from prior nvim installations. If you find yourself
switching this up frequently, or testing your own nvim, a `cleannvim.sh` script
is likely to help:

    #!/bin/sh
    rm $HOME/.config/nvim/plugin/packer_compiled.lua
    rm -rf $HOME/.cache/nvim
    rm -rf $HOME/.local/share/nvim


## Customization

If tracking this repo, to override options or mappings,  copy
`nvim/user-example.lua` to `nvim/user.lua`; place your customizations there and
restart nvim. Future `git pull` activity won't touch your personalizations.

## Features

- Usable default configuration for code and general purpose editing
- Via [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim), and Mason nvim
  gets auto-installed and auto-configured (mostly) Language Servers 
- Menus ([folke/which-key.nvim](https://github.com/folke/which-key.nvim)) guide
  and help one become more vim keys aware
- Optional user configuration file sourced at startup

## Almost. No. Bling.

## Tips

- **Leader** and **menus**: The `<Leader>` key default is the space bar; hit
  the <Leader> key in normal mode to see and navigate via menus.

- **Common Mappings**: which-key also exposes menus in normal mode for common
  movement-related mappings such as **d** (delete), **y** (yank), **g**
  (go/movement), **z** (folds, spelling). In normal mode, press these keys
  (once) to see more.

- **Clipboard**: Interacts with the system Clipboard, i.e. `ctrl-c` to copy
  text from a web browser, for example, can be pasted into your nvim buffer
  using the standard p or P keys.

- **Mason**: Use `:Mason` (or <Leader>lm) to bring up the interactive LSP
  installer. When editing a new filetype, the system is also configured to
  prompt you to install a matching language server.

### Node (install only if needed)

For language servers and treesitter parsers requiring `nodejs` infrastructure
be in place, you'll want to install / configure `nodejs` such that you don't
need root access to add packages.

Include a variable in your `.bashrc` or other shell config:

    # nodejs - global packages per user, avoids need for sudo in: npm i -g <pkgname>
    # https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
    export NPM_CONFIG_PREFIX=~/.npm-global

Start a new terminal session to reflect the change before installing anything with `npm -g`.

### Treesitter CLI (install only if needed)

After installing and configuring `nodejs` as above, if a desired parser
requires the treesitter cli:

    npm install -g tree-sitter

Be sure your path to npm's bin directory is in your path (default:
$HOME/.npm-global/bin).

### File Layout
    .
    ├── lua
    │   └── core
    │       ├── config
    │       │   ├── bufferline.lua
    │       │   ├── comment.lua
    │       │   ├── gitsigns.lua
    │       │   ├── init.lua
    │       │   ├── lualine.lua
    │       │   ├── nvim-tree.lua
    │       │   ├── treesitter.lua
    │       │   └── zerolsp.lua
    │       ├── autocommands.lua
    │       ├── init.lua    <- packer and plugins
    │       ├── mapping.lua
    │       └── options.lua
    ├── init.lua
    ├── LICENSE
    ├── README.md
    └── user-example.lua

