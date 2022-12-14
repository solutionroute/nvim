-- nvim/lua/core/mapping.lua
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command

local map = vim.keymap.set

-- <Leader> = space
map("", "<Space>", "<Nop>", {silent = true})
vim.g.mapleader = " "

-- map the individual way
map("n", "<Tab>", "<cmd>bnext<CR>", {desc = "Buffer Next"})
map("n", "<S-Tab>", "<cmd>bprevious<CR>", {desc = "Buffer Previous"})
map("n", "<C-s>", "<cmd>write<CR>", {desc = "write buffer"}) -- same as <Leader>w

-- or the which-key way (these all for <Leader>)
local wk = require("which-key")
local tb = require("telescope.builtin")
local gs = require("gitsigns")
wk.register({
  d = {"<cmd>bdelete<cr>", "close buffer"},
  e = {"<cmd>NvimTreeFindFileToggle<cr>", "explore files"},
  h = {"<cmd>nohlsearch<cr>", "highlight clear"},
  q = {"<cmd>quitall<cr>", "quit all buffers"},
  w = {"<cmd>write<cr>", "write buffer"},
  s = {
    name = "search", -- optional group name
    b = { tb.buffers, "search buffers" },
    f = { tb.find_files, "search files" },
    g = { tb.live_grep, "grep files" },
    h = { tb.help_tags, "search help" },
    m = { tb.marks, "search marks" },
    p = { tb.builtin, "search telescope pickers" },
    q = { tb.quickfix, "search quickfix" },
    r = { tb.oldfiles, "search recent" },
  },
  l = {
    name = "language server",
    d = { tb.lsp_definitions, "Go to Definition" }, -- also Ctrl-W]
    b = { tb.lsp_document_symbols, "List symbols in buffer" },
    l = {"<cmd>LspInfo<cr>", "Lsp info" },
    m = {"<cmd>Mason<cr>", "Mason" },
  },
  p = {
    name = "packer",
    c = {"<cmd>PackerCompile<cr>", "packer compile" },
    i = {"<cmd>PackerInstall<cr>", "packer install" },
    s = {"<cmd>PackerSync<cr>", "packer sync"},
    S = {"<cmd>PackerStatus<cr>", "packer status" },
    u = {"<cmd>PackerUpdate<cr>", "packer update" },
  },
  g = {
    name = "git",
    g = {"<cmd>Telescope git_status<cr>", "Git Status"},
    j = { gs.next_hunk, "Next git hunk" },
    k = { gs.prev_hunk, "Previous git hunk" },
    l = { gs.blame_line, "View git blame" },
    p = { gs.preview_hunk, "Preview git hunk" },
    h = { gs.reset_hunk, "Reset git hunk" },
    r = { gs.reset_buffer, "Reset git buffer" },
    s = { gs.stage_buffer, "Stage git buffer" },
    S = { gs.stage_hunk, "Stage git hunk" },
    t = { gs.toggle_deleted, "Toggle deleted" },
    u = { gs.undo_stage_hunk, "Unstage git hunk" },
    d = { gs.diffthis, "View git diff" },
  }
}, { prefix = "<leader>" })

