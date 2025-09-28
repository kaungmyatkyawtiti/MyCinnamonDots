return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      vim.keymap.del("n", "<leader>uG")
    end,
  },
}
