require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

vim.o.mouse = "i" -- only enable in insert mode

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
