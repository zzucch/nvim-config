local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.git_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tg", builtin.diagnostics, {})

require("telescope").setup({
	pickers = {
		live_grep = {
			file_ignore_patterns = { "node_modules", ".git", ".venv" },
			additional_args = function(_)
				return { "--hidden" }
			end,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
