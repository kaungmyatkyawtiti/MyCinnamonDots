-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = LazyVim.safe_keymap_set

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +6<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -6<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -6<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +6<cr>", { desc = "Increase Window Width" })

map("n", "<leader>w+", "<cmd>resize +6<cr>", { desc = "Increase Window Height" })
map("n", "<leader>w_", "<cmd>resize -6<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>w<", "<cmd>vertical resize -6<cr>", { desc = "Decrease Window Width" })
map("n", "<leader>w>", "<cmd>vertical resize +6<cr>", { desc = "Increase Window Width" })
