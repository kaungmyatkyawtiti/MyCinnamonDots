-- ~/.config/nvim/lua/plugins/which-key.lua

return {
  "folke/which-key.nvim",
  opts = {
    triggers = {
      -- explicitly list only the prefixes you want which-key to watch
      "<leader>",
      -- add more if needed, e.g.:
      -- "<localleader>", "g", "z"
    },

    -- Optional: this will prevent spam in visual mode
    defer = function(ctx)
      return ctx.mode ~= "n"
    end,
  },
}
