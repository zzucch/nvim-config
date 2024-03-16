-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- i mean..
vim.keymap.set({ "i", "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Down>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Right>", "<Nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- rw for netrw
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- fav ctrl shift arrows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- lsp
vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {})

vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>vrf", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
-- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
