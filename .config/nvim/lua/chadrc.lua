-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig

local M = {}

M.base46 = {
  theme = "gruvbox",

  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
  },
}

vim.schedule(function()
  require("customs.autocmds")
end)

-- override highlights to use undercurl for errors
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#fb4934" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#fabd2f" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#83a598" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#8ec07c" })

return M
