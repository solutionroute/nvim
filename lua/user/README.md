# User customizations

You can customizations your installation while still tracking this repo. Note
that the filenames are important.

## Options, Mappings, Autocommands

Using the supplied example config.lua file as a template, copy it:

    cp $HOME/.config/nvim/user-config-example.lua $HOME/.config/nvim/lua/user/config.lua

This file is sourced at the very end of nvim startup with a protected call
essentially equal to `requires("user.config")`.

## Plugins

Using the supplied example plugins.lua file as a template, copy it:

    cp $HOME/.config/nvim/user-plugins.example.lua $HOME/.config/nvim/lua/user/plugins.lua

This file is sourced at the very end of Packer initialization startup with a
protected call essentially equal to `requires("user.plugins")`.

You can "use" and configure additional plugins in that file; a working example
which installs the zen-mode plugin, and maps `<Leader>z` to it.

    return function(use)
        use({
        "folke/zen-mode.nvim",
          config = function()
            require("zen-mode").setup({
            })
            vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<cr>", {desc = "Zen Mode toggle"})
          end
        })
    end

## Troubleshooting issues

Both user.config and user.plugins are loaded using `pcall`, a protected call
that won't barf or break your nvim should a typo or error land in either. The
flip side of this is you won't have feedback when things aren't working as you
expect.

If you are trying to debug issues, consider sourcing this from nvim/init.lue
*temporarily* with a call like:

    require("user.plugins")

... until you sort out the issue. Or, type carefully!
