-- Center view when navigating
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- Clear search highlighting
vim.keymap.set("n", "<F3>", ":set hlsearch!<CR>")
