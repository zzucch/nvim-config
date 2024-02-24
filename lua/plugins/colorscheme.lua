return {
	{
		"catppuccin/nvim",
		--	enabled = false,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				show_end_of_buffer = false,
				term_colors = true,
				styles = {
					comments = {},
					conditionals = {},
				},
				-- flavour = "latte"
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme kanagawa-wave")
			vim.cmd("colorscheme kanagawa-dragon")
			-- vim.cmd("colorscheme kanagawa-lotus")
		end,
	},
}
