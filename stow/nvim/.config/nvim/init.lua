-- install plugins
vim.pack.add({
	-- libraries
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	-- color schemes
	{ src = "https://github.com/miikanissi/modus-themes.nvim" },
	-- git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- navigation
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/karb94/neoscroll.nvim" },
	-- lsp
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/seblyng/roslyn.nvim" },
	-- treesitter
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    -- editing
	{ src = "https://github.com/nvim-mini/mini.pairs" },
    -- others
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})
vim.cmd("packadd nvim.undotree")

-- enable plugins
require("modus-themes").setup({
    transparent = true,
})
require("mini.icons").setup()
require("gitsigns").setup()
require("mini.pick").setup()
require('neoscroll').setup({
  duration_multiplier = 2,
  performance_mode = false,
})
require("mason").setup()
require("mason-lspconfig").setup()
require("tree-sitter-manager").setup({ auto_install = true })
require('mini.pairs').setup()
vim.cmd.colorscheme("modus")

-- lsp
vim.o.autocomplete = true
vim.o.complete = ".,w,b,o"
vim.o.completeopt = "menuone,noselect,fuzzy,popup"
vim.o.pumheight = 10

-- tree-sitter
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- lsp & tree-sitter status
local function show_language_status()
	local bufnr = vim.api.nvim_get_current_buf()
	-- lsp
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local lsp = (#clients > 0) and clients[1].name or "missing"
	-- tree-sitter
	local parser = vim.treesitter.get_parser(bufnr)
	local ts = parser and parser:lang() or "missing"

	vim.api.nvim_echo({
		{ ("lsp: %s"):format(lsp), "Normal" },
		{ " | ", "Comment" },
		{ ("tree-sitter: %s"):format(ts), "Normal" },
	}, false, {})
end
vim.api.nvim_create_autocmd({
	"BufEnter",
	"LspAttach",
	"LspDetach",
	"FileType",
}, {
	callback = function()
		vim.schedule(show_language_status)
	end,
})

-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>y", require("yazi").yazi)
vim.keymap.set("n", "<leader>u", require("undotree").open)
vim.keymap.set("n", "<leader>i", show_language_status)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<S-Up>", function () require('neoscroll').scroll(-0.5, { duration=70}) end)
vim.keymap.set("n", "<S-Down>", function () require('neoscroll').scroll(0.5, { duration=70}) end)
