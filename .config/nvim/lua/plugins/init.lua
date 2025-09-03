return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      require("configs.treesitter")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gblame", "Gstatus" }, -- load only when you call these
  },

  {
    "folke/zen-mode.nvim",
    opts = require("configs.zen-mode"),
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    enabled = true,
    config = function()
      require("configs.incline")
    end,
  }

  -- These are some examples, uncomment them if you want to see them work!
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
