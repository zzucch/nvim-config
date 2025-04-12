vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- i mean..
vim.keymap.set({ "i", "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Down>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Right>", "<Nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "J", "JmiJ`i")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>p", [["_dP]])
vim.keymap.set("v", "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, {})
