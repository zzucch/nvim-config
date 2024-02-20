-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- i mean..
vim.keymap.set({'i', 'n'}, "<Up>", "<Nop>")
vim.keymap.set({'i', 'n'}, "<Down>", "<Nop>")
vim.keymap.set({'i', 'n'}, "<Left>", "<Nop>")
vim.keymap.set({'i', 'n'}, "<Right>", "<Nop>")
