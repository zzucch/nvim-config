-- i mean it can be handy, so
function ColorMyPencils(color)
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        -- flavour = "latte",
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        styles = {
          comments = {},
          conditionals = {},
        },
      })
      -- ColorMyPencils("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- ColorMyPencils("kanagawa-wave")
      -- ColorMyPencils("kanagawa-dragon")
      -- ColorMyPencils("kanagawa-lotus")"
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })
      ColorMyPencils("rose-pine")
    end,
  },
}
