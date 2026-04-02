return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("luasnip.loaders.from_vscode").lazy_load()
		require("fidget").setup()
		require("mason").setup()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"buf_ls",
				"dockerls",
				"gopls",
				"lua_ls",
			},
		})

		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			capabilities = capabilities,
			settings = {
				shellcheck = {
					enable = true,
					executable = "shellcheck",
					arguments = { "--format", "json" },
				},
			},
		})

		vim.lsp.config("buf_ls", {
			cmd = { "buf", "beta", "lsp" },
			capabilities = capabilities,
		})

		vim.lsp.config("dockerls", {
			cmd = { "docker-langserver", "--stdio" },
			capabilities = capabilities,
		})

		vim.lsp.config("gopls", {
			cmd = { "gopls" },
			capabilities = capabilities,
			settings = {
				gopls = {
					buildFlags = { "-tags=integration,e2e" },
					gofumpt = false,
					codelenses = {
						test = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						shadow = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					directoryFilters = {
						"-.git",
						"-.vscode",
						"-.idea",
						"-.vscode-test",
						"-node_modules",
					},
					semanticTokens = true,
				},
			},
		})

		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.enable({
			"bashls",
			"buf_ls",
			"dockerls",
			"gopls",
			"lua_ls",
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			update_in_insert = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
