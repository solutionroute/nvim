# nvim

A simple to understand yet capable Neovim configuration for coding or writing.

Fork and extend, or clone and continue to track this repo and use `user.lua` to
personalize as you wish.

For code completion and diagnostics,
[lsp-zero.nvim](https://github/VonHeikemen/lsp-zero.nvim) brings together (so
you don't have to) all the bits needed to deliver multi-language code
completion and diagnostics, along with automatic installation and (mostly)
automatic configuration. One small tweak for Go is included.

This configuration will continue to track stable Neovim (0.8+ currently).


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

## Installation

Backup (or rename) any existing `~/.config/nvim`; then:

    cd $HOME/.config
    # rename existing without clobbering
    mv -n nvim nvim-yourgithubname

    # clone and link nvim to the repo
    git clone https://github.com/solutionroute/nvim.git nvim-solutionroute
    ln -sv nvim-solutionroute nvim

Then run `nvim`; Packer will self-install if required and automatically install
or update necessary plugins. After the bootstrap is complete, quit `nvim` and
restart and enjoy your newly configured editor.

If the bootstrap process runs into any issues due to leftover files from
another configuration, consider clearing out cached and shared files - create a
script or copy and paste the relevant commands:

    #!/bin/sh
    rm $HOME/.config/nvim/plugin/packer_compiled.lua
    rm -rf $HOME/.cache/nvim
    rm -rf $HOME/.local/share/nvim

Then again run `nvim` to bootstrap packer; quit nvim when done and restart.

## Customization

If tracking this repo, to override options or mappings without those efforts
being clobbered by a future update, create `user.lua` and edit to taste:

    cd $HOME/.config/nvim
    cp -n user-example.lua user.lua

Place all your personalizations within `user.lua` and restart nvim.

Coming soon: user-supplied plugin management.

## Key Features 

- Automatic installation/bootstrap as is the norm these days
- Zero configuration required for most programming languages
- Code completion and diagnostics; uninstall that vscode ;-)
- Auto imports and format for Go and other languages
- Git indicators (gitsigns) and commands (Fugitive)
- Optionally restore a previous editing session
- Telescope of course
- And, which-key menus aiding your finger muscle-memory

## Tips

- **Leader**: The `<Leader>` key default is <Space>.

- **Common Mappings**: which-key also exposes menus in normal mode for common
  movement-related mappings such as **c** (cut/change), **d** (delete), **y**
  (yank), **g** (go/movement), **v** (visual), **z** (folds, spelling). In
  normal mode, press these keys (once) to see more. Multi-key mappings like
  <C-w> will also display a menu after timeout.

- **Clipboard**: Interacts with the system Clipboard, i.e. `ctrl-c` to copy
  text from a web browser, for example, can be pasted into your nvim buffer
  using the standard p or P keys.

- **Mason**: Use `:Mason` (or <Leader>lm) to bring up the interactive LSP
  installer. When editing a new filetype, the system will also  
  prompt you to install a matching language server.

## Optional Software

### Nodejs (install only if needed)

For language servers and treesitter parsers requiring `nodejs` infrastructure
be in place, you'll want to install / configure `nodejs` such that you don't
need root access to add packages.

Include a variable in your `.bashrc` or other shell config:

    # nodejs - global packages per user, avoids need for sudo in: npm i -g <pkgname>
    # https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
    export NPM_CONFIG_PREFIX=~/.npm-global

Be sure your path to npm's bin directory is in your path (default:
`$HOME/.npm-global/bin`).

Start a new terminal session to reflect the change before installing anything with `npm -g`.

### Treesitter CLI (install only if needed)

After installing and configuring `nodejs` as above, if a desired parser
requires the treesitter cli:

    npm install -g tree-sitter

## File Layout

The core of this configuration revolves around `nvim/lua/core/init.lua` where
packer and plugins are defined; simple configurations are attached to the
plugin declaration, while anything more complicated goes into `config/*`. 

User-provided configuration will be picked up if `nvim/user.lua` exists.

    .
    ├── lua
    │   └── core
    │       ├── autocommands.lua
    │       ├── config
    │       │   ├── colorscheme.lua
    │       │   ├── comment.lua
    │       │   ├── gitsigns.lua
    │       │   ├── init.lua
    │       │   ├── treesitter.lua
    │       │   └── zerolsp.lua
    │       ├── init.lua
    │       ├── mapping.lua
    │       └── options.lua
    ├── init.lua
    ├── LICENSE
    ├── README.md
    └── user-example.lua

