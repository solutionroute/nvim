-- nvim/lua/core/mapping.lua
-- Modes: n - normal; i - insert; v - visual; x - block mode; c - command

local map = vim.keymap.set

-- <Leader> = space
map("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- map the individual way
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Buffer Next" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Buffer Previous" })
map("n", "<C-s>", "<cmd>write<CR>", { desc = "write buffer" }) -- same as <Leader>w
map("i", "<C-s>", "<esc><cmd>write<CR>", { desc = "write buffer" }) -- same as <Leader>w

-- or the which-key way (these all for <Leader>)
local wk = require("which-key")
local tb = require("telescope.builtin")
local gs = require("gitsigns")

wk.register({
    d = { "<cmd>bdelete<cr>", "close buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "explore file tree" },
    f = { "gwap<cr>", "format paragraph" },
    h = { "<cmd>nohlsearch<cr>", "highlight clear" },
    w = { "<cmd>write<cr>", "write buffer" },
    q = {
        name = "quit/sessions",
        q = { "<cmd>quitall<cr>", "quit all buffers" },
        -- https://github.com/folke/persistence.nvim
        d = { "<cmd>lua require('persistence').load()<cr>", "session restore directory" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "session restore" },
        n = { "<cmd>lua require('persistence').stop()<cr>", "session don't save" },
    },
    s = {
        name = "search",
        b = { tb.buffers, "search buffers" },
        c = { tb.colorscheme, "search colorschemes" },
        f = { tb.find_files, "search files" },
        g = { tb.live_grep, "search with grep" },
        h = { tb.help_tags, "search help" },
        k = { tb.keymaps, "search keymaps" },
        m = { tb.marks, "search marks" },
        p = { tb.builtin, "search telescope pickers" },
        q = { tb.quickfix, "search quickfix" },
        r = { tb.oldfiles, "search recent" },
    },
    l = {
        name = "language server",
        b = { tb.lsp_document_symbols, "lsp buffer symbols" },
        d = { tb.lsp_definitions, "lsp jump to definition" }, -- also Ctrl-W]
        i = { "<cmd>LspInfo<cr>", "lsp info" },
        m = { "<cmd>Mason<cr>", "mason" },
    },
    p = {
        name = "packer",
        c = { "<cmd>PackerCompile<cr>", "packer compile" },
        i = { "<cmd>PackerInstall<cr>", "packer install" },
        s = { "<cmd>PackerSync<cr>", "packer sync" },
        S = { "<cmd>PackerStatus<cr>", "packer Status" },
        u = { "<cmd>PackerUpdate<cr>", "packer update" },
    },
    g = {
        name = "git",
        d = { gs.diffthis, "git diff" },
        f = { tb.git_files, "search git files" },
        S = { tb.git_status, "show git status" },
        j = { gs.next_hunk, "next git hunk" },
        k = { gs.prev_hunk, "previous git hunk" },
        l = { gs.blame_line, "list git blame" },
        p = { gs.preview_hunk, "review git hunk" },
        h = { gs.stage_hunk, "stage git hunk" },
        H = { gs.reset_hunk, "reset git hunk" },
        r = { gs.reset_buffer, "reset git buffer" },
        s = { gs.stage_buffer, "stage git buffer" },
        t = { gs.toggle_deleted, "toggle deleted" },
        u = { gs.undo_stage_hunk, "unstage git hunk" },
    }
}, { prefix = "<leader>" })
