-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.api.nvim_set_keymap
keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- disable replace paste
keymap("n", "x", '"_x', { silent = true })
keymap("n", "X", '"_X', { silent = true })
keymap("v", "x", '"_x', { silent = true })
keymap("v", "X", '"_X', { silent = true })
keymap("v", "p", '"_dP', { silent = true })
