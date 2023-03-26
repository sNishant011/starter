-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.api.nvim_set_keymap
keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- disable replace paste
keymap("v", "p", '"_dP', { silent = true })

-- write out
keymap("n", "<leader>wo", ":w<CR>", { silent = true })

-- toggle term
keymap("n", "<F7>", ":ToggleTerm<CR>", { silent = true })
keymap("t", "<F7>", "<C-\\><C-n>:ToggleTerm<CR>", { silent = true })
