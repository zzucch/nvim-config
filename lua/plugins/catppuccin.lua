return {
	"catppuccin/nvim",

	enabled = false,

	lazy = false,
	priority = 1000,
	config = function()
		-- require("catppuccin").setup({ flavour = "latte" })
		vim.cmd.colorscheme("catppuccin")
	end,
}
