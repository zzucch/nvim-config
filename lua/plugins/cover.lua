require("coverage").setup({
	auto_reload = true,
	highlights = {
		covered = { fg = "#35eb10" },
		uncovered = { fg = "#f52a18" },
	},
})

vim.keymap.set("n", "<leader>cc", ":Coverage<cr>")
