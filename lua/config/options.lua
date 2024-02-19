-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Insert indents automatically
vim.o.breakindent = true
-- vim.o.autoindent = true

-- search and replace
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.showmatch = true

-- clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.pumblend = 10

-- lines
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.termguicolors = true -- True color support