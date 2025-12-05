vim.g.mapleader = " "

local s = vim.keymap.set

-- Navigation
local all_modes = { "n", "i", "v", "x", "s", "o", "t" }
s(all_modes, "<a-up>", "<cmd>:wincmd k<CR>")
s(all_modes, "<a-down>", "<cmd>:wincmd j<CR>")
s(all_modes, "<a-left>", "<cmd>:wincmd h<CR>")
s(all_modes, "<a-right>", "<cmd>:wincmd l<CR>")

-- Splits
s("n", "|", ":vsplit<CR>")
s("n", "\\", ":split<CR>")
s("n", "-", "<cmd>:vertical resize -2<CR>")
s("n", "=", "<cmd>:vertical resize +2<CR>")
s("n", "_", "<cmd>:resize -1<CR>")
s("n", "+", "<cmd>:resize +1<CR>")

-- Escape terminal
s("t", "<esc><esc>", "<c-\\><c-n>")

-- Other
s({ "n", "i" }, "<c-s>", "<cmd>:w<CR>")

s("n", "<leader>h", ":nohlsearch<CR>")
