require("trouble").setup({})

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>te", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>")
