vim.scriptencoding = "utf-8"

vim.opt.ambiwidth = "single"
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.helplang = "ja"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.listchars = { tab = ">>", trail = "-", nbsp = "+", space = "⋅", eol = "↴" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true

vim.cmd.colorscheme("kanagawa-wave")

local keymap = vim.keymap

-- Fern
vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#renderer#nerdfont#indent_markers"] = 1
vim.g["fern#default_hidden"] = 1
keymap.set("n", "<C-f>", ":Fern . -drawer -reveal=% -toggle -width=30<CR>", { silent = true })

-- MarkdownPreview
vim.g["mkdp_auto_close"] = 0
vim.g["mkdp_refresh_slow"] = 1

vim.g.mapleader = " "
keymap.set("i", "jj", "<Esc>")
-- 表示行単位で上下移動
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "gj", "j")
keymap.set("n", "gk", "k")
keymap.set("n", "<C-l>", ":bnext<CR>", { silent = true })
keymap.set("n", "<C-h>", ":bprev<CR>", { silent = true })
keymap.set("n", "<C-c>", ":bd<CR>", { silent = true })
keymap.set("t", "jj", "<C-\\><C-n>")
keymap.set("t", "<ESC>", "<C-\\><C-n>")
keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>", { silent = true })
