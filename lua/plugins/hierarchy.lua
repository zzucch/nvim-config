return {
    "jmacadie/telescope-hierarchy.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    keys = {
        {
            "<leader>hi",
            "<cmd>Telescope hierarchy incoming_calls<cr>",
        },
        {
            "<leader>ho",
            "<cmd>Telescope hierarchy outgoing_calls<cr>",
        },
    },
    opts = {
        extensions = {
            hierarchy = {},
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("hierarchy")
    end,
}
