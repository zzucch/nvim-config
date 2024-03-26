return {
	--	{
	--		"rcarriga/nvim-notify",
	--		config = function()
	--			require("notify").setup({
	--				background_colour = "#000000",
	--			})
	--		end,
	--	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			-- "rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			arg = "leet",
			lang = "golang",
		},
	},
}
