return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local ibl = require("ibl")
        ibl.setup({
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        })
    end,
}
