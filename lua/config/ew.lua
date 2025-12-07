local function wrap_err_return()
	local buf = vim.api.nvim_get_current_buf()
	local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
	local return_line = vim.api.nvim_buf_get_lines(buf, cursor_row - 1, cursor_row, false)[1]

	if not return_line or not (return_line:match("return.*err%w*") or return_line:match("return.*,.*err%w*")) then
		vim.notify("not on a `return err` line", vim.log.levels.ERROR)
		return
	end

	local err_var
	if return_line:match("return%s+" .. "err%w*") then
		err_var = return_line:match("return%s+(err%w*)") or "err"
	else
		local return_vars = {}
		for var in return_line:gmatch("([^,%s]+)") do
			if var ~= "return" then
				table.insert(return_vars, var)
			end
		end
		err_var = return_vars[#return_vars]
	end

	local if_line = vim.api.nvim_buf_get_lines(buf, cursor_row - 2, cursor_row - 1, false)[1]
	if not if_line or not if_line:match("if%s+" .. err_var .. "%s*!=") then
		vim.notify("no matching `if " .. err_var .. " != nil` block found above", vim.log.levels.ERROR)
		return
	end

	local func_start_line = cursor_row - 3
	local func_name = nil
	while func_start_line >= 0 do
		local line = vim.api.nvim_buf_get_lines(buf, func_start_line, func_start_line + 1, false)[1]
		if line and line:match("%w+%(") then
			func_name = line:match("([%w%.]+)%(")
			break
		end
		func_start_line = func_start_line - 1
	end

	if not func_name then
		vim.notify("no function call found above", vim.log.levels.ERROR)
		return
	end

	local short_func_name = func_name:match("[^%.]+%.(.+)") or func_name

	local new_return
	local return_vars = {}
	for var in return_line:gmatch("([^,%s]+)") do
		if var ~= "return" then
			table.insert(return_vars, var)
		end
	end

	if #return_vars == 1 then
		new_return = "return errors.Wrap(" .. err_var .. ', "' .. short_func_name .. '")'
	else
		local new_return_vars = {}
		for i, var in ipairs(return_vars) do
			if i == #return_vars then
				table.insert(new_return_vars, "errors.Wrap(" .. var .. ', "' .. short_func_name .. '")')
			else
				table.insert(new_return_vars, var)
			end
		end
		new_return = "return " .. table.concat(new_return_vars, ", ")
	end

	vim.api.nvim_buf_set_lines(buf, cursor_row - 1, cursor_row, false, { new_return })
end

vim.keymap.set("n", "<leader>ew", wrap_err_return)
