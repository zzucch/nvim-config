require("telescope").setup({
	extensions = {
		hierarchy = {},
	},
})
require("telescope").load_extension("hierarchy")

vim.keymap.set("n", "<leader>hi", "<cmd>Telescope hierarchy incoming_calls<cr>")
vim.keymap.set("n", "<leader>ho", "<cmd>Telescope hierarchy outgoing_calls<cr>")
