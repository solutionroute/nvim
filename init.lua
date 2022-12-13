-- https://github.com/solutionroute/nvim - Neovim configuration meant to be simple, understandable yet functional

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
    vim.schedule(function() vim.notify("Unsupported Neovim Version! Must be 0.8 or greater", "error") end)
else
    require('core')
    -- lua/user.lua is not part of this repo and can be used as a per-user override
    local user_overrides = vim.fn.stdpath('config') .. '/lua/user.lua'
    local f = io.open(user_overrides)
    if f then
        f:close()
        require('user')
    end
end
