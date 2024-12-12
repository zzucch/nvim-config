return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local null_ls = require("null-ls")

            opts.root_dir = opts.root_dir
                or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

            opts.sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.code_actions.impl,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.diagnostics.golangci_lint.with({
                    -- extra_args = { "--enable-all" },
                }),
                null_ls.builtins.diagnostics.staticcheck,
                null_ls.builtins.diagnostics.hadolint,
            }
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
            })
        end,
    },
}
