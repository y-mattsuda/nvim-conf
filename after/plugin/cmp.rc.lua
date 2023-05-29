local lspkind = require "lspkind"
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function (args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            border = "single",
        }),
        documentation = cmp.config.window.bordered({
            border = "single",
        }),
    },
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "nvim_lsp_signature_help" },
            { name = "calc" },
        },
        {
            { name = "buffer", keyword_length = 2 },
        }
    ),
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
        })
    },
})
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp_document_symbol" },
        },
        {
            { name = "buffer" },
        }
    )
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = "path" },
        },
        {
            { name = "cmdline", keyword_length = 2 },
        }
    )
})
vim.cmd("let g:vsnip_filetypes = {}")
