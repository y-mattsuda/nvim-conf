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
-- require("mason-null-ls").setup({
-- 	automatic_setup = true,
-- 	handlers = {},
-- })
local null_ls = require("null-ls")
local sources = {
	-- lua
	null_ls.builtins.formatting.stylua,
	-- python
	null_ls.builtins.diagnostics.ruff,
	null_ls.builtins.formatting.black,
	-- go
	null_ls.builtins.formatting.gofmt,
	-- javascript, typescript
	null_ls.builtins.formatting.prettier,
	-- markdown
	null_ls.builtins.diagnostics.markdownlint,
	null_ls.builtins.diagnostics.textlint.with({ filetypes = { "markdown" } }),
	-- protobuf
	null_ls.builtins.diagnostics.buf,
	null_ls.builtins.formatting.buf,
	--go
	null_ls.builtins.diagnostics.staticcheck,
	require("typescript.extensions.null-ls.code-actions"),
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		-- format on save
		-- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

-- keymap
-- built-in
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.api.nvim_create_autocmd(
	"FileType",
	{ pattern = "typescript", command = [[nnoremap <buffer><silent> gD :TypescriptGoToSourceDefinition<CR>]] }
)
-- Lspsaga
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- Telescope
vim.keymap.set("n", "gE", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- Severity signs in nvim lsp diagnostics
local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
	local h1 = "DiagnosticSign" .. type
	vim.fn.sign_define(h1, { text = icon, texth1 = h1, numh1 = h1 })
end
