# nvim

A simple to understand, maintainable yet feature full Neovim configuration for
coding or writing.

Wanting to rewrite the personal configuration I had been using to better take advantage of LSP features, I decided to try to make this useful for others using simple personalization mechanisms - check the README files. Or, fork and extend for yourself.

The heavy lifting for language support is done by plugin
[lsp-zero.nvim](https://github/VonHeikemen/lsp-zero.nvim) replaced a ton of LSP configuration code I used to maintain.

You'll get multi-language code completion, signatures, inspection, diagnostics and auto-formatting. Automatic installation of nvim, plugins, LSP features and (mostly) automatic configuration are icing on the cake. 

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

This Neovim configuration will continue to track stable nvim (0.8+ currently).

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

You can track this repo while maintaining your own customizations separate from
the repo code. 

For more information, read `user-config-example.lua` and
`user-plugins-example.lua`and copy as needed to the user.config directory.

## Key Features 

- Automatic installation/bootstrap as is the norm these days
- Zero configuration required for most programming languages
- EditorConfig auto-sets ts/sw and other params
- Code completion and diagnostics; uninstall that vscode ;-)
- Auto imports for Go and auto format for all supported languages/file types
- Git indicators and commands
- Optionally restore a previous editing session (files open, windows, state)
- Telescope of course
- And, which-key menus to aid your finger muscle-memory

## Leader & Menus 

- **Leader**: The `<Leader>` key default is `<Space>`.

- **Common Mappings**: which-key also exposes menus in normal mode for common
  movement-related mappings such as **c** (cut/change), **d** (delete), **y**
  (yank), **g** (go/movement), **v** (visual), **z** (folds, spelling). In
  normal mode, press these keys (once) to see more. Multi-key mappings like
  `<C-w>` will also display a menu after timeout.

## Screenshots

Showing the default Nordfox theme (modified with a slightly darker bg color), from the [EdenEast/nightfox.nvim theme](https://github.com/EdenEast/nightfox.nvim) pack:

Signature while typing, go to defintion, tree explorer
![fn sigs and more](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/fnsig-tree-fndef.png)

Code Completion
![code-completion](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/code-completion.png)

Which-key menus (c cut/change key)
![which-key menus](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/whichkey-c-menu.png)

## Optional Software

Some language servers and treesitter parsers rely on `nodejs`, so you *may*
need to install Node and a package manager on your machine. 

### Nodejs

You may wish to configure `nodejs` in a way that doesn't require root access to
add packages.

1. Include a variable in your `.bashrc` or relevant shell config file:

        # nodejs - global packages per user, avoids need for sudo in: npm i -g <pkgname>
        # https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
        export NPM_CONFIG_PREFIX=~/.npm-global

2. Be sure your path to npm's bin directory is in your path. Ddefault:

        $HOME/.npm-global/bin

3. Start a new terminal session to reflect the change before installing
   anything with `npm -g`.

### Treesitter CLI (install only if needed)

After installing and configuring `nodejs`, if a desired parser
requires the treesitter cli:

    npm install -g tree-sitter

## File Layout

The core of this configuration revolves around `nvim/lua/core/init.lua` where
packer and plugins are defined. 

User-provided config.lua and plugins.lua, if needed, should be created within
lua/user/*. See the example files for guidance.

    .
    ├── lua
    │   ├── core
    │   │   ├── autocommands.lua
    │   │   ├── config
    │   │   │   ├── colorscheme.lua
    │   │   │   ├── comment.lua
    │   │   │   ├── gitsigns.lua
    │   │   │   ├── init.lua
    │   │   │   ├── nvimtree.lua
    │   │   │   ├── treesitter.lua
    │   │   │   └── zerolsp.lua
    │   │   ├── init.lua
    │   │   ├── mapping.lua
    │   │   └── options.lua
    │   └── user
    │       └── README.md
    ├── init.lua
    ├── LICENSE
    ├── README.md
    ├── user-config-example.lua
    └── user-plugins-example.lua
