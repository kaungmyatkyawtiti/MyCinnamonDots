require "nvchad.mappings"

local map = vim.keymap.set

-- My Custom keybindings
-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
-- insert mode escape
map("i", "jk", "<ESC>")

-- LSP code action
vim.keymap.set("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- toggle zen-mode
map("n", "<leader>wm", function()
  require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })

-- LazyVim-style: <leader>wo = close all except current
map("n", "<leader>wd", function()
  require("customs.utils.buffers").buf_close_others(false)
end, { desc = "Close other buffers", noremap = true, silent = true })

-- force (like :BufOnly!)
map("n", "<leader>wD", function()
  require("customs.utils.buffers").buf_close_others(true)
end, { desc = "Close other buffers (force)", noremap = true, silent = true })

-- Terminal toggle
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({
    pos = "float",
    id = "floatTerm",
    float_opts = {
      row = 0.05,
      col = 0.15,
      width = 0.65,
      height = 0.75
    }
  })
end, { desc = "terminal toggle floating term" })

-- Split shortcuts
map("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })
map("n", "<leader>|", ":vsplit<CR>", { desc = "Vertical split" })

-- Custom split resize keys
vim.api.nvim_set_keymap('n', '<C-w>>', '10<C-w>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w><', '10<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>+', '5<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>-', '5<C-w>-', { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
