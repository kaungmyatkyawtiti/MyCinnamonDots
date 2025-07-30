return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  enabled = true,
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#665c54", guifg = "#fabd2f" },
          InclineNormalNC = { guifg = "#928374", guibg = "#242424" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
