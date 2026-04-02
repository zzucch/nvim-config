return {
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		version = "*",
		keys = {
			{ "<leader>cc", ":Coverage<cr>" },
		},
		opts = {
			auto_reload = true,
			highlights = {
				covered = { fg = "#35eb10" },
				uncovered = { fg = "#f52a18" },
			},
		},
	},
}
