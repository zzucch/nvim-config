-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- i mean..
vim.keymap.set({ "i", "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Down>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Right>", "<Nop>")

-- idk about this one really
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- ex
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
