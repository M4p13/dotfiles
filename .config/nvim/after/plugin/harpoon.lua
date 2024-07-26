local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term") 
vim.keymap.set("n","<leader>a", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-q>", function( )ui.nav_file(1) end)
vim.keymap.set("n", "<C-w>", function( )ui.nav_file(2) end)
vim.keymap.set("n", "<C-e>", function( )ui.nav_file(3) end)

vim.keymap.set("n", "<leader>tt", function()
  term.gotoTerminal(1)
end)