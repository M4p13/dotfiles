vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open file view

vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste system clip
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy selection into system clip

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- yank up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- yank down

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("t", "<leader><ESC>", "<C-\\><C-n>")


