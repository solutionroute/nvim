local ok, utils = pcall(require, "Comment.utils")
if not ok then
  return
end

local ok, utils = pcall(require, "Comment.utils")
if not ok then
  return
end

local ok, m = pcall(require, "Comment")
if not ok then
  return
end

m.setup({
  pre_hook = function(ctx)
    local location = nil
    if ctx.ctype == utils.ctype.blockwise then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == utils.ctype.linewise and "__default" or "__multiline",
      location = location,
    }
  end,
})
