local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})
require("nvim-dap-virtual-text").setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

local vscode = require("dap.ext.vscode")
local json = require("plenary.json")
vscode.json_decode = function(str)
	return vim.json.decode(json.json_strip_comments(str))
end

vim.keymap.set("n", "<leader>du", function()
	dapui.toggle({})
end, { desc = "Dap UI" })
vim.keymap.set({ "n", "x" }, "<leader>de", function()
	dapui.eval()
end, { desc = "Eval" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint Condition" })
vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { desc = "Run/Continue" })
vim.keymap.set("n", "<leader>dC", function()
	dap.run_to_cursor()
end, { desc = "Run to Cursor" })
vim.keymap.set("n", "<leader>dg", function()
	dap.goto_()
end, { desc = "Go to Line (No Execute)" })
vim.keymap.set("n", "<leader>di", function()
	dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dj", function()
	dap.down()
end, { desc = "Down" })
vim.keymap.set("n", "<leader>dk", function()
	dap.up()
end, { desc = "Up" })
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end, { desc = "Run Last" })
vim.keymap.set("n", "<leader>do", function()
	dap.step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>dO", function()
	dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>dP", function()
	dap.pause()
end, { desc = "Pause" })
vim.keymap.set("n", "<leader>dr", function()
	dap.repl.toggle()
end, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>ds", function()
	dap.session()
end, { desc = "Session" })
vim.keymap.set("n", "<leader>dt", function()
	dap.terminate()
end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dw", function()
	require("dap.ui.widgets").hover()
end, { desc = "Widgets" })

require("dap-go").setup({
	dap_configurations = {
		{
			type = "go",
			name = "Debug integration test",
			request = "launch",
			mode = "test",
			program = "${fileDirname}",
			buildFlags = "-tags=integration,e2e",
		},
	},
	delve = {
		path = "dlv",
		initialize_timeout_sec = 20,
		args = {},
		build_flags = {},
		detached = vim.fn.has("win32") == 0,
	},
	tests = {
		verbose = false,
	},
})
