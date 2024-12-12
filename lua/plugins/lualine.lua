return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        vim.o.statusline = " "
    end,
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    { "diagnostics" },
                    { "filename",   separator = "", padding = { left = 1, right = 0 } },
                },
                lualine_x = {},
                lualine_y = {
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {},
            },
            extensions = {
                "lazy",
            },
        })
    end,
}
