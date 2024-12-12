vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.breakindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmatch = true

if not vim.env.SSH_TTY then
    vim.opt.clipboard = "unnamedplus"
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.guicursor = ""

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.termguicolors = true
vim.opt.pumblend = 10

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.fillchars = { eob = " " }

vim.g.markdown_recommended_style = 0

vim.opt.wildmode = "longest:full,full"
