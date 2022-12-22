local keymap = vim.keymap.set
local opts = { silent = true }
-- Silent keymap option

-- Leader Key
vim.g.mapleader = " "

-- Netrw
keymap("n", "<leader>e", vim.cmd.Ex)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Format with LSP
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
