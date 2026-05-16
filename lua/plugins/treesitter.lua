vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("Treesitter", { clear = true }),
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if not lang then
			return
		end
		local ok = pcall(vim.treesitter.start)
		if not ok then
			local available = require("nvim-treesitter.config").get_available()
			if vim.tbl_contains(available, lang) and vim.fn.exepath("tree-sitter") ~= "" then
				require("nvim-treesitter.install").install({ lang })
			end
		end
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf) then
				pcall(vim.treesitter.start, buf)
			end
		end
	end,
})

vim.filetype.add({
	pattern = { [".*/hypr.*%.conf"] = "hyprlang" },
})
