return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
        },
    },
    config = function()
        local conform = require("conform")

        conform.setup({
            log_level = vim.log.levels.INFO,
            default_format_opts = {
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                -- go = { "gofumpt", "goimports" },
                jq = { "jq" },
                -- json = { "fixjson" },
                markdown = { "mdformat" },
                yq = { "yq" },
                sh = { "shellcheck" },
                zsh = { "shellcheck" },
                proto = { "clang-format" },
            },
        })
    end,
}
