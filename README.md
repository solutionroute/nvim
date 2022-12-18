# nvim

A keep-it-simple and understandable Neovim configuration in lua, meant for code
and general purpose editing. For nvim 0.8+ and will continue to track current stable.


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

## Features

- Keeping it simple yet functional is a core feature.
- Usable default configuration for code and general purpose editing.
- Auto-installed and (mostly) auto-configured Language Servers via
  [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) and
  [mason.nvim](https://github.com/williamboman/mason.nvim).
- Menus ([folke/which-key.nvim](https://github.com/folke/which-key.nvim)) guide
  and help one become more vim keys aware.
- Personalize this while still tracking the repo.

## Installation

Backup (or rename) any existing `~/.config/nvim`; then:

    cd $HOME/.config
    # rename existing without clobbering
    mv -n nvim nvim-yourgithubname

    # clone and link nvim to the repo
    git clone https://github.com/solutionroute/nvim.git nvim-solutionroute
    ln -sv nvim-solutionroute nvim

Then run `nvim`; the first time it is run it will determine if the [packer]()
package manager needs to be bootstrapped. After the plugins have been
installed, quit and restart `nvim`.

If you run into any issues in bootstrapping your new `nvim` these will likely
be due to leftovers from prior nvim installations. If you find yourself
switching this up frequently, or testing your own nvim, a `cleannvim.sh` script
is likely to help:

    #!/bin/sh
    rm $HOME/.config/nvim/plugin/packer_compiled.lua
    rm -rf $HOME/.cache/nvim
    rm -rf $HOME/.local/share/nvim

Then run `nvim` to bootstrap packer; quit nvim when done and restart.

## Customization

If tracking this repo, to override options or mappings without those efforts
being clobbered by a future `git pull`:

    cd $HOME/.config/nvim
    cp -n user-example.lua user.lua

Place all your personalizations within `user.lua` and restart nvim.

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

## Optional

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

