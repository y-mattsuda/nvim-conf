local lsp_names = function()
	local clients = {}
	for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		if client.name == "null-ls" then
			local sources = {}
			for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
				table.insert(sources, source.name)
			end
			table.insert(clients, "null-ls(" .. table.concat(sources, ", ") .. ")")
		else
			table.insert(clients, client.name)
		end
	end
	return " " .. table.concat(clients, ", ")
end

require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			lsp_names,
			{
				"diagnostics",
				source = { "nvim-lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_y = { "filetype" },
		lualine_z = { "progress" },
	},
})
