vim.env.PATH = vim.env.PATH .. ":/opt/homebrew/bin:/usr/local/bin"

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/rose-pine/neovim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/jmacadie/telescope-hierarchy.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/folke/trouble.nvim",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/andythigpen/nvim-coverage",
	"https://github.com/wakatime/vim-wakatime",
})

require("config.keymaps")
require("config.ew")
require("config.options")

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.lsp-config")
require("plugins.none-ls")
require("plugins.lint")
require("plugins.lualine")
require("plugins.indent-blankline")
require("plugins.trouble")
require("plugins.harpoon")
require("plugins.oil")
require("plugins.cover")
require("plugins.hierarchy")
require("plugins.dap")
require("plugins.wakatime")
