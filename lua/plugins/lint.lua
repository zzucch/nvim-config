return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },
            json = { "jsonlint" },
            make = { "checkmake" },
            markdown = { "markdownlint" },
            sh = { "bash", "shellcheck" },
            zsh = { "shellcheck", "zsh" },
            -- proto = { "protolint" }, -- too many warnings, might come back configuring it in the future
            -- lua = { "luacheck" },
        }

        lint.linters.golangcilint.args = {
            "run",
            "--out-format",
            "json",
            "--show-stats=false",
            "--print-issued-lines=false",
            "--issues-exit-code=0",
            "--print-linter-name=false",
            "--config",
            os.getenv("HOME") .. "/.golangci.yaml",
            function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
        }

        lint.linters.checkmake.args = {
            "--format='{{.LineNumber}}:{{.Rule}}:{{.Violation}}\n'",
            "--config",
            os.getenv("HOME") .. "/.config/checkmake.ini",
        }

        lint.linters.yamllint.args = {
            "-c",
            os.getenv("HOME") .. "/.yamllint.yaml",
            "--format",
            "parsable",
            "-",
        }

        lint.linters.spectral.args = {
            "lint",
            "-f",
            "json",
            "--ruleset",
            os.getenv("HOME") .. "/.spectral.yaml",
        }

        vim.api.nvim_create_autocmd({
            "BufReadPost",
            "BufWritePost",
            "InsertLeave",
        }, {
            group = vim.api.nvim_create_augroup("Linting", { clear = true }),
            callback = function(ev)
                if
                    (string.find(ev.file, ".github/workflows/") or string.find(ev.file, ".github/actions/"))
                    and vim.bo.filetype == "yaml"
                then
                    lint.try_lint("actionlint")
                elseif vim.bo.filetype == "yaml" then
                    local first_line = vim.fn.getline(1)
                    if string.find(first_line, "openapi:") then
                        lint.try_lint("spectral")
                    else
                        lint.try_lint("yamllint")
                    end
                else
                    lint.try_lint(nil, { ignore_errors = true })
                end
            end,
        })
    end,
}
