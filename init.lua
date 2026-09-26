require("config.lazy")

local map = vim.keymap.set

-- Basic Keymaps --
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source File" })
map("n", "<leader>x", ":.lua<CR>", { desc = "Execute lua code by line" })
map("v", "<leader>x", ":lua<CR>", { desc = "Execute lua code by visual selecting lines" })

map("n", "<C-d>", "<C-d>zz", { desc = "Half Page Down And Center Screen" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half Page Up And Center Screen" })

map("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Turn off highlighted search" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Visual Selected Lines Up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Visual Selected Lines Down" })

map("n", "n", "nzzzv", { desc = "Search Next Term And Center Screen" })
map("n", "N", "Nzzzv", { desc = "Search Prev Term And Center Screen" })

-- greatest remap ever
map("x", "<leader>p", [["_dP]], { desc = "Keep yanked/deleted item in yank register" })

-- Options --
vim.opt.number = true
vim.opt.relativenumber = true

-- Share system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.smartindent = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 100

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.hl_op()  end,
})
