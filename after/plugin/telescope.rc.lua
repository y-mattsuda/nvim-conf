local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-f>"] = "cycle_history_next",
                ["<C-b>"] = "cycle_history_prev",
            },
            n = {
                ["q"] = "close",
            },
        },
    },
})
