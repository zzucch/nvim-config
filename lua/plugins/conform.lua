return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            log_level = vim.log.levels.DEBUG,
            formatters_by_ft = {
                -- go = { "gofumpt", "goimports" },
                jq = { "jq" },
                -- json = { "fixjson" },
                markdown = { "mdformat" },
                yq = { "yq" },
                sh = { "shellcheck" },
                zsh = { "shellcheck" },
            },
        })
    end,
}
