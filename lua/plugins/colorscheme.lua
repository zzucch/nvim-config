return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
            })

            vim.cmd.colorscheme("rose-pine")

            local groups = {
                "Normal",
                "NormalNC",
                "CursorLine",
                "CursorLineNC",
            }

            for _, group in ipairs(groups) do
                vim.api.nvim_set_hl(0, group, { bg = "none" })
            end
        end,
    },
}
