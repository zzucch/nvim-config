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

		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"buf_ls",
				"dockerls",
				"gopls",
				"lua_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["bashls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.bashls.setup({
						capabilities = capabilities,
						settings = {
							shellcheck = {
								enable = true,
								executable = "shellcheck",
								arguments = { "--format", "json" },
							},
						},
					})
				end,
				["marksman"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.marksman.setup({
						capabilities = capabilities,
					})
				end,
				-- https://writewithharper.com/docs/integrations/neovim
				-- https://github.com/Automattic/harper/tree/master/harper-core/src/linting
				["harper_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.harper_ls.setup({
						capabilities = capabilities,
						settings = {
							["harper-ls"] = {
								linters = {
									SentenceCapitalization = false,
									SpelledNumbers = true,
									Spaces = false,
								},
								isolateEnglish = true,
							},
						},
					})
				end,
				["buf_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.buf_ls.setup({
						capabilities = capabilities,
					})
				end,
				["gopls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								gofumpt = true,
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
								staticcheck = true,
								directoryFilters = {
									"-.git",
									"-.vscode",
									"-.idea",
									"-.vscode-test",
									"-node_modules",
									"-.nvim",
								},
								semanticTokens = true,
							},
						},
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
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
				end,
			},
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
