require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

map("n", "<leader>wm", function()
  require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({
    pos = "float",
    id = "floatTerm",
    float_opts = {
      row = 0.05,    -- vertical offset (0–1)
      col = 0.15,    -- horizontal offset (0–1)
      width = 0.65,  -- screen width %
      height = 0.75, -- screen height %
    }
  })
end, { desc = "terminal toggle floating term" })

vim.o.mouse = "i" -- only enable in insert mode

-- Horizontal split
map("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })

-- Vertical split
map("n", "<leader>|", ":vsplit<CR>", { desc = "Vertical split" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
