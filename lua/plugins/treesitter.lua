return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "bash",
        "c",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "html",
        "lua",
        "vimdoc",
      },
      -- install synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = {
        enable = true,
      },
    })

    vim.filetype.add({
      pattern = { [".*/hypr.*%.conf"] = "hyprlang" },
    })
  end,
}
