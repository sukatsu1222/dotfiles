-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Don't save deleted content to clipboard with d and c commands
-- Use the black hole register ("_)
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })

vim.keymap.set("n", "c", '"_c', { noremap = true })
vim.keymap.set("n", "C", '"_C', { noremap = true })
vim.keymap.set("n", "cc", '"_cc', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })
