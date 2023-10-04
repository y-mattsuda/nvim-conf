-- LSP Server management
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

-- keymap
-- built-in
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.api.nvim_create_autocmd(
	"FileType",
	{ pattern = "typescript", command = [[nnoremap <buffer><silent> gD :TypescriptGoToSourceDefinition<CR>]] }
)
-- Lspsaga
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "go", "<cmd>Lspsaga outline<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "gs", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- Telescope
vim.keymap.set("n", "gE", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
-- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- Severity signs in nvim lsp diagnostics
local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
	local h1 = "DiagnosticSign" .. type
	vim.fn.sign_define(h1, { text = icon, texth1 = h1, numh1 = h1 })
end
