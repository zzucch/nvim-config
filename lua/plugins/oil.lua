return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = { "icon" },
				keymaps = {
					["<C-t>"] = false,
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>")
			vim.keymap.set("n", "<space>-", require("oil").toggle_float)
		end,
	},
}
