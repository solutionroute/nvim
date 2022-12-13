
require('core.plugins') -- should be first, as it initializes packer if not installed
require('core.config') -- configuration for plugins that require more than a simple setup()
require('core.options') -- neovim options
require('core.mapping') -- key maps, mostly driven by Whichkey
