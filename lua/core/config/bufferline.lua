-- https://github.com/akinsho/bufferline.nvim
local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
  return
end

bufferline.setup{options={
  offsets = {{
    filetype = "NvimTree",
    -- text = "File Explorer",
    text = function()
      return vim.fn.getcwd()
    end,
    highlight = "Directory",
    separator = true, -- use a "true" to enable the default, or set your own character
    }
  },
  diagnostics = "nvim_lsp", -- highlight tab title text if errors
}}

