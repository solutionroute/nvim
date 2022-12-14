-- nvim/core/init.lua
require('core.plugins') -- initializes packer if not installed
require('core.config') -- configuration for plugins
require('core.options') -- nvim options
require('core.mapping') -- key maps and menus, mostly driven by which-key
require('core.autocommands') -- autocommands with no better place to go
