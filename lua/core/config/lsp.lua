require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "sqlls", "sumneko_lua", "vimls",},
  automatic_installation = true,
})
require("mason-null-ls").setup({
    ensure_installed = { "goimports", },
    automatic_setup = true,
})

local lsp_options = {
	-- on_attach = on_attach,
	-- flags = {
	-- 	debounce_text_changes = 150,
	-- },
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
  -- https://github.com/williamboman/mason.nvim/discussions/77#discussioncomment-3158769:
  ["sumneko_lua"] = function ()
    require("lspconfig").sumneko_lua.setup(vim.tbl_deep_extend("force", lsp_options, {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the 'vim', 'use' global
            globals = {'vim', 'use', 'require'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {enable = false},
        },
      }
    }))
  end
}

-- local on_attach = function(_, _)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--   -- TODO FIXME wrong arg  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
--   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
--
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--   vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
-- end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

--
-- require("lspconfig").gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {'gopls'},
--   settings = {
--     gopls = {
--       experimentalPostfixCompletions = true,
--       analyses = {
--         unusedparams = true,
--         shadow = true,
--       },
--       staticcheck = true,
--     },
--   },
--   init_options = {
--     usePlaceholders = true,
--   }
-- }
--
