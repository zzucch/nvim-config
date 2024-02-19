return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.shellcheck,
    })

    vim.keymap.set({'n', 'v'}, '<C-A-l>', vim.lsp.buf.format, {})
  end
}
