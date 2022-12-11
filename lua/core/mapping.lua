-- mapping.lua
-- Note: Here, and in core.config.*, be sure to add "desc" attributes to each mapping.
-- "prefix" mappings are defined in core.config.which-key.lua for lack of a better place

-- map(mode, key, action, opts)
local map = vim.keymap.set
-- std opts for most maps
local opts = { silent = true }

-- <Leader> = space
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- map the individual way
map("n", "<Tab>", "<cmd>bnext<CR>", {desc = "Buffer Next"})
map("n", "<S-Tab>", "<cmd>bprevious<CR>", {desc = "Buffer Previous"})
map("n", "<Leader>q", "<cmd>quitall<CR>", {desc = "Quit All"})
map("n", "<Leader>w", "<cmd>write<CR>", {desc = "Write File"})
map("n", "<C-s>", "<cmd>write<CR>", {desc = "Write File"})

-- or the which-key way
local wk = require("which-key")
wk.register({
  s = {
    name = "search", -- optional group name
    b = { function() require("telescope.builtin").buffers() end, "Search buffers" },
    f = { function() require("telescope.builtin").find_files() end, "Search files" },
    h = { function() require("telescope.builtin").help_tags() end, "Search help" },
    m = { function() require("telescope.builtin").marks() end, "Search marks" },
    r = { function() require("telescope.builtin").oldfiles() end, "Search recent" },
  },
  p = {
    name = "packer",
    c = {"<cmd>PackerCompile<cr>", "Packer Compile" },
    i = {"<cmd>PackerInstall<cr>", "Packer Install" },
    r = {"<cmd>source $MYVIMRC<CR>", "Reload Configuration"},
    s = {"<cmd>source $MYVIMRC | PackerSync <CR>", "Reload Config & Packer Sync"},
    S = {"<cmd>PackerStatus<cr>", "Packer Status" },
    u = {"<cmd>PackerUpdate<cr>", "Packer Update" },
  },
  g = {
    name = "git",
    S = {"<cmd>Telescope git_status<cr>", "Git Status"},
    j = { function() require("gitsigns").next_hunk() end, "Next git hunk" },
    k = { function() require("gitsigns").prev_hunk() end, "Previous git hunk" },
    l = { function() require("gitsigns").blame_line() end, "View git blame" },
    p = { function() require("gitsigns").preview_hunk() end, "Preview git hunk" },
    h = { function() require("gitsigns").reset_hunk() end, "Reset git hunk" },
    r = { function() require("gitsigns").reset_buffer() end, "Reset git buffer" },
    s = { function() require("gitsigns").stage_hunk() end, "Stage git hunk" },
    u = { function() require("gitsigns").undo_stage_hunk() end, "Unstage git hunk" },
    d = { function() require("gitsigns").diffthis() end, "View git diff" },
  }
}, { prefix = "<leader>" })

