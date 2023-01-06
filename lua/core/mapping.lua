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
map("n", ";r", "gwap", { desc = "reflow paragraph" })
map("n", "<Backspace>", ":", { desc = "command line" })

-- or the which-key way (these all for <Leader>)
local wk = require("which-key")
local tb = require("telescope.builtin")

wk.register({
	-- one key
	d = { "<cmd>bdelete<cr>", "close buffer" },
	f = { tb.find_files, "file picker" },
	h = { "<cmd>nohlsearch<cr>", "highlight clear" },
	w = { "<cmd>write<cr>", "write buffer" },
	-- two keys
	g = {
		name = "git",
		l = { "<cmd>LazyGit<cr>", "lazygit" },
		f = { tb.git_files, "search git files" },
		S = { tb.git_status, "show git status" },
	},
	l = {
		name = "language server",
		b = { tb.lsp_document_symbols, "lsp buffer symbols" },
		d = { tb.lsp_definitions, "jump to lsp definition" }, -- also Ctrl-W]
		D = { "<cmd>TroubleToggle<cr>", "diagnostic window" },
		n = { vim.diagnostic.goto_next, "jump to next diagnostic" },
		p = { vim.diagnostic.goto_prev, "jump to previous diagnostic" },
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
		g = { tb.live_grep, "search with grep" },
		h = { tb.help_tags, "search help" },
		k = { tb.keymaps, "search keymaps" },
		m = { tb.marks, "search marks" },
		p = { tb.builtin, "search telescope pickers" },
		q = { tb.quickfix, "search quickfix" },
		r = { tb.oldfiles, "search recent" },

	},
	t = {
		name = "toggle",
		s = { "<cmd>set invspell<cr>", "spell check" },
	},
}, { prefix = "<leader>" })
