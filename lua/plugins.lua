vim.cmd.packadd("packer.nvim")

require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
	use("rebelot/kanagawa.nvim")
	-- Nvim Treesitter configurations and abstraction layer
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Tools for better development in rust using neovim's builtin lsp
	use("simrat39/rust-tools.nvim")
	-- A Lua plugin, written in TypeScript, to write TypeScript (Lua optional).
	use({
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({})
		end,
	})
	-- -- Standalone UI for nvim-lsp progress
	-- use("j-hui/fidget.nvim")
	-- improve neovim lsp experience
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({
				rename = {
					in_select = false,
				},
			})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	-- completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-calc")
	-- LSP icon
	use("onsails/lspkind.nvim")
	-- 🌿 General purpose asynchronous tree viewer written in Pure Vim script
	use("lambdalisue/fern.vim")
	-- 👓 Fundemental plugin to handle Nerd Fonts in Vim
	use("lambdalisue/nerdfont.vim")
	-- 🌿 fern.vim plugin which add file type icon through nerdfont.vim
	use("lambdalisue/fern-renderer-nerdfont.vim")
	-- 🌿 Add Git status badge integration on file:// scheme on fern.vim
	use("lambdalisue/fern-git-status.vim")

	-- A snazzy bufferline for Neovim
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	-- A minimalist Neovim plugin that auto pairs & closes brackets written in 100% Lua.
	use({
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	})
	-- Find, Filter, Preview, Pick. All lua, all the time.
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = "nvim-lua/plenary.nvim",
	})
	-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua
	--     Old text                    Command         New text
	-- --------------------------------------------------------------------------------
	--     surr*ound_words             ysiw)           (surround_words)
	--     *make strings               ys$"            "make strings"
	--     [delete ar*ound me!]        ds]             delete around me!
	--     remove <b>HTML t*ags</b>    dst             remove HTML tags
	--     'change quot*es'            cs'"            "change quotes"
	--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
	--     delete(functi*on calls)     dsf             function calls
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	-- Indent guides for Neovim
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({})
		end,
	})
	-- A neovim lua plugin to help easily manage multiple terminal windows
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})
	-- Use treesitter to auto close and auto rename html tag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	})
	-- Git integration for buffers
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	-- 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	use({
		"folke/noice.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	disable = true,
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- })
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
end)
