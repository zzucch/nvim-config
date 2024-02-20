return {
	"nvimtools/none-ls.nvim",
	opts = function(_, opts)
		local null_ls = require("null-ls")

		opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

		opts.sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.diagnostics.shellcheck,
		}

		vim.keymap.set({ "n", "v" }, "<C-A-l>", vim.lsp.buf.format, {})
	end,
}
