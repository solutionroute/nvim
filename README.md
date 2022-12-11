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

# Customization

If you want to override options or mappings while still tracking this repo,
this can be done by copying `lua/user-example.lua` to `lua/user.lua`; place
your customizations there.

## Status

I've moved much of my old functionality over to this cleaner configuration but
as of Dec 11 2022 still have some mappings/Whichkey setup to complete. 

